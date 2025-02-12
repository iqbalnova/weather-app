import 'package:equatable/equatable.dart';

import '../../domain/entities/weather_realtime_entities.dart';

class WeatherRealtimeResponse extends Equatable {
  final DateTime time;
  final Map<String, dynamic> values;
  final Map<String, double> location;

  const WeatherRealtimeResponse({
    required this.time,
    required this.values,
    required this.location,
  });

  @override
  List<Object?> get props => [time, values, location];

  factory WeatherRealtimeResponse.fromJson(Map<String, dynamic> json) {
    return WeatherRealtimeResponse(
      time: DateTime.parse(json['data']['time']),
      values: json['data']['values'],
      location: {
        'lat': json['location']['lat'],
        'lon': json['location']['lon'],
      },
    );
  }

  WeatherRealtimeEntity toEntity() {
    return WeatherRealtimeEntity(
      time: time,
      cloudBase: values['cloudBase']?.toDouble() ?? 0.0,
      cloudCeiling: values['cloudCeiling']?.toDouble() ?? 0.0,
      cloudCover: values['cloudCover']?.toInt() ?? 0,
      dewPoint: values['dewPoint']?.toDouble() ?? 0.0,
      freezingRainIntensity: values['freezingRainIntensity']?.toDouble() ?? 0.0,
      hailProbability: values['hailProbability']?.toDouble() ?? 0.0,
      hailSize: values['hailSize']?.toDouble() ?? 0.0,
      humidity: values['humidity']?.toInt() ?? 0,
      precipitationProbability:
          values['precipitationProbability']?.toInt() ?? 0,
      pressureSeaLevel: values['pressureSeaLevel']?.toInt() ?? 0,
      pressureSurfaceLevel: values['pressureSurfaceLevel']?.toInt() ?? 0,
      rainIntensity: values['rainIntensity']?.toDouble() ?? 0.0,
      sleetIntensity: values['sleetIntensity']?.toDouble() ?? 0.0,
      snowIntensity: values['snowIntensity']?.toDouble() ?? 0.0,
      temperature: values['temperature']?.toDouble() ?? 0.0,
      temperatureApparent: values['temperatureApparent']?.toDouble() ?? 0.0,
      uvHealthConcern: values['uvHealthConcern']?.toInt() ?? 0,
      uvIndex: values['uvIndex']?.toInt() ?? 0,
      visibility: values['visibility']?.toInt() ?? 0,
      weatherCode: values['weatherCode']?.toInt() ?? 0,
      windDirection: values['windDirection']?.toInt() ?? 0,
      windGust: values['windGust']?.toDouble() ?? 0.0,
      windSpeed: values['windSpeed']?.toDouble() ?? 0.0,
      latitude: location['lat'] ?? 0.0,
      longitude: location['lon'] ?? 0.0,
    );
  }
}
