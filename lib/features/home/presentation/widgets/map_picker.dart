import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../core/injection.dart';

class MapPickerResult {
  final LatLng latLng;
  final String address;

  MapPickerResult(this.latLng, this.address);
}

class MapPickerPage extends StatefulWidget {
  const MapPickerPage({super.key});

  @override
  MapPickerPageState createState() => MapPickerPageState();
}

class MapPickerPageState extends State<MapPickerPage> {
  LatLng? _pickedLocation;
  String? _pickedAddress;
  GoogleMapController? _mapController;
  final Location _location = Location();
  final FlutterSecureStorage _storage = locator<FlutterSecureStorage>();

  @override
  void initState() {
    super.initState();
    _loadSelectedLocation();
  }

  Future<void> _loadSelectedLocation() async {
    String? lat = await _storage.read(key: 'selected_lat');
    String? lon = await _storage.read(key: 'selected_lon');

    if (lat != null && lon != null) {
      double parsedLat = double.tryParse(lat) ?? -7.5666; // Default Surakarta
      double parsedLon = double.tryParse(lon) ?? 110.8167;

      setState(() {
        _pickedLocation = LatLng(parsedLat, parsedLon);
      });

      // Geser kamera ke lokasi yang dipilih sebelumnya
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(LatLng(parsedLat, parsedLon)),
      );

      // Ambil alamat dari koordinat yang sudah tersimpan
      _getAddressFromLatLng(LatLng(parsedLat, parsedLon));
    } else {
      _getCurrentLocation(); // Jika belum ada lokasi tersimpan, pakai lokasi saat ini
    }
  }

  // Get the current location and add a marker on the map
  Future<void> _getCurrentLocation() async {
    final locationData = await _location.getLocation();
    final currentLatLng =
        LatLng(locationData.latitude!, locationData.longitude!);

    setState(() {
      _pickedLocation = currentLatLng;
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLng(currentLatLng),
    );

    // Reverse geocode to get the address of the current location
    _getAddressFromLatLng(currentLatLng);
  }

  // Reverse geocoding to get the address from LatLng
  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        geo.Placemark place = placemarks.first;

        // Ambil nama kota atau daerah
        String? city = place.locality; // Kota
        String? region = place.subAdministrativeArea; // Kabupaten/Kota
        String? province = place.administrativeArea; // Provinsi

        // Gunakan yang tersedia
        String address = city ?? region ?? province ?? "Unknown Location";

        setState(() {
          _pickedAddress = address;
          _pickedLocation = latLng;
        });
      }
    } catch (e) {
      setState(() {
        _pickedAddress = "Unable to fetch address";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Location'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.done,
              color: Colors.green,
              size: 28,
            ),
            onPressed: () async {
              if (_pickedLocation != null && _pickedAddress != null) {
                await _storage.write(
                    key: 'selected_lat',
                    value: _pickedLocation!.latitude.toString());
                await _storage.write(
                    key: 'selected_lon',
                    value: _pickedLocation!.longitude.toString());
                await _storage.write(
                    key: 'selected_address', value: _pickedAddress!.toString());
                if (context.mounted) {
                  Navigator.pop(context,
                      MapPickerResult(_pickedLocation!, _pickedAddress!));
                }
              } else {
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                    if (_pickedLocation != null) {
                      _mapController!.animateCamera(
                        CameraUpdate.newLatLng(_pickedLocation!),
                      );
                    }
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(
                        -6.200000, 106.816666), // Default location (Jakarta)
                    zoom: 12,
                  ),
                  markers: _pickedLocation != null
                      ? {
                          Marker(
                            markerId: const MarkerId('picked-location'),
                            position: _pickedLocation!,
                          ),
                        }
                      : {},
                  onTap: (position) {
                    setState(() {
                      _pickedLocation = position;
                    });
                    _getAddressFromLatLng(position);
                  },
                ),
                Positioned(
                  bottom: 100,
                  right: 8,
                  child: FloatingActionButton(
                    mini: true,
                    onPressed: _getCurrentLocation,
                    child: const Icon(Icons.my_location),
                  ),
                )
              ],
            ),
          ),
          if (_pickedAddress != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selected Address: $_pickedAddress',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
