import 'package:equatable/equatable.dart';

import '../../domain/entities/weather_realtime_entities.dart';

class WeatherRealtimeModel extends Equatable {
  final WeatherRealtimeEntity entity;

  const WeatherRealtimeModel({required this.entity});

  @override
  List<Object?> get props => [entity];

  // Getters for easy access to entity properties
  DateTime get time => entity.time;
  double get temperature => entity.temperature;
  double get temperatureApparent => entity.temperatureApparent;
  int get humidity => entity.humidity;
  int get weatherCode => entity.weatherCode;
  double get windSpeed => entity.windSpeed;

  // Helper methods for UI
  String get formattedTime =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  String get formattedTemperature => '${temperature.round()}°C';

  String get formattedFeelsLike => '${temperatureApparent.round()}°C';

  String get formattedHumidity => '$humidity%';

  String get formattedWindSpeed => '${windSpeed.toStringAsFixed(1)} m/s';

  bool get isRaining =>
      entity.rainIntensity > 0 || entity.precipitationProbability > 0;

  bool get isCloudy => entity.cloudCover > 50;

  String getWeatherDescription() {
    switch (weatherCode) {
      case 1001:
        return 'Cloudy';
      default:
        return 'Unknown';
    }
  }
}
