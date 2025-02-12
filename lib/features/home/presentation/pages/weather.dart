import 'package:driweather/features/home/presentation/bloc/weather_realtime/weather_realtime_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles.dart';
import '../../../../common/utils.dart';
import '../../../core/injection.dart';
import '../widgets/map_picker.dart';
import '../widgets/weather_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/images.dart';
import '../../../core/router/app_routes.dart';
import '../widgets/notification_list.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  final FlutterSecureStorage _storage = locator<FlutterSecureStorage>();
  String _selectedAddress = "Surakarta";
  double _selectedLat = -7.5666;
  double _selectedLon = 110.8167;

  @override
  void initState() {
    super.initState();
    _loadSelectedAddress();
  }

  Future<void> _loadSelectedAddress() async {
    String? address = await _storage.read(key: 'selected_address');
    String? lat = await _storage.read(key: 'selected_lat');
    String? lon = await _storage.read(key: 'selected_lon');

    if (address != null && lat != null && lon != null) {
      setState(() {
        _selectedAddress = address;
        _selectedLat = double.tryParse(lat) ?? _selectedLat;
        _selectedLon = double.tryParse(lon) ?? _selectedLon;
      });
    } else {
      setState(() {
        _selectedAddress = "Pick Location";
        _selectedLat = -7.5666;
        _selectedLon = 110.8167;
      });
    }
  }

  void _showNotificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Your notification",
                  style: boldStyle,
                ),
              ),
              Expanded(
                child: NotificationList(
                  notifications: NotificationConstants.notifications,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff47BFDF), Color(0xff4A91FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Image.asset(
              Images.bgWeatherLeft,
              width: 100.w,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              Images.bgWeatherRight,
              width: 260.w,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: WeatherHeaderWidget(
                    cityName: _selectedAddress,
                    onLocationTap: () async {
                      final result = await Navigator.pushNamed(
                          context, AppRoutes.mapPicker);

                      if (result is MapPickerResult) {
                        setState(() {
                          _selectedAddress = result.address;
                        });
                      }
                    },
                    onNotificationTap: () =>
                        _showNotificationBottomSheet(context),
                    hasNotification: true,
                  ),
                ),
                BlocProvider(
                  create: (context) => locator<WeatherRealtimeBloc>()
                    ..add(FetchWeatherRealtimeEvent(
                        lat: _selectedLat, lon: _selectedLon)),
                  child: BlocBuilder<WeatherRealtimeBloc, WeatherRealtimeState>(
                    builder: (context, state) {
                      if (state is WeatherRealtimeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is WeatherRealtimeLoaded) {
                        final weatherRealtimeData = state.weatherRealtime;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              getWeatherIcon(weatherRealtimeData.weatherCode),
                              width: 300.w,
                              fit: BoxFit.contain,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: whiteColor),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormatter.formatToReadableDate(
                                        weatherRealtimeData.time),
                                    style: whiteTextStyle,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${weatherRealtimeData.temperature}°',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 60.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    getWeatherDescription(
                                        weatherCode:
                                            weatherRealtimeData.weatherCode),
                                    style: semiBoldStyle.copyWith(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.windIcon,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      Text("Wind", style: whiteTextStyle),
                                      SizedBox(width: 8),
                                      Text("|", style: whiteTextStyle),
                                      SizedBox(width: 8),
                                      Text(
                                          '${(weatherRealtimeData.windSpeed * 3.6).toStringAsFixed(1)} km/h',
                                          style: whiteTextStyle),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.humidityIcon,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      Text("Hum", style: whiteTextStyle),
                                      SizedBox(width: 8),
                                      Text("|", style: whiteTextStyle),
                                      SizedBox(width: 8),
                                      Text('${weatherRealtimeData.humidity} %',
                                          style: whiteTextStyle),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (state is WeatherRealtimeError) {
                        return const Center(
                          child: Text(
                            'Oops, something went wrong. Please try again later!',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200.w,
                  margin: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.weatherDetail,
                          arguments: {
                            'lon': _selectedLon,
                            'lat': _selectedLat
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black45,
                    ),
                    child: Text(
                      "Weather Details",
                      style: semiBoldStyle.copyWith(color: Color(0xff444E72)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
