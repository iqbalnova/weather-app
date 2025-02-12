// weather_models.dart
import 'package:driweather/features/home/domain/entities/weather_entities.dart';
import 'package:equatable/equatable.dart';

class HourlyWeatherModel extends Equatable {
  final String time;
  final WeatherValuesHourlyModel values;

  const HourlyWeatherModel({
    required this.time,
    required this.values,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      time: json['time'],
      values: WeatherValuesHourlyModel.fromJson(json['values']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'values': values.toJson(),
    };
  }

  HourlyWeather toEntity() {
    return HourlyWeather(
      time: time,
      values: values.toEntity(),
    );
  }

  @override
  List<Object?> get props => [time, values];
}

class DailyWeatherModel extends Equatable {
  final String time;
  final WeatherValuesDailyModel values;

  const DailyWeatherModel({
    required this.time,
    required this.values,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      time: json['time'],
      values: WeatherValuesDailyModel.fromJson(json['values']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'values': values.toJson(),
    };
  }

  DailyWeather toEntity() {
    return DailyWeather(
      time: time,
      values: values.toEntity(),
    );
  }

  @override
  List<Object?> get props => [time, values];
}

class WeatherValuesHourlyModel extends Equatable {
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double precipitationProbability;
  final int weatherCode;

  const WeatherValuesHourlyModel({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.precipitationProbability,
    required this.weatherCode,
  });

  factory WeatherValuesHourlyModel.fromJson(Map<String, dynamic> json) {
    return WeatherValuesHourlyModel(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      precipitationProbability:
          (json['precipitationProbability'] as num).toDouble(),
      weatherCode: json['weatherCode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'precipitationProbability': precipitationProbability,
      'weatherCode': weatherCode,
    };
  }

  WeatherValuesHourly toEntity() {
    return WeatherValuesHourly(
      temperature: temperature,
      humidity: humidity,
      windSpeed: windSpeed,
      precipitationProbability: precipitationProbability,
      weatherCode: weatherCode,
    );
  }

  @override
  List<Object?> get props =>
      [temperature, humidity, windSpeed, precipitationProbability, weatherCode];
}

class WeatherValuesDailyModel extends Equatable {
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double precipitationProbability;
  final int weatherCodeMin;
  final int weatherCodeMax;

  const WeatherValuesDailyModel({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.precipitationProbability,
    required this.weatherCodeMin,
    required this.weatherCodeMax,
  });

  factory WeatherValuesDailyModel.fromJson(Map<String, dynamic> json) {
    return WeatherValuesDailyModel(
      temperature: (json['temperatureApparentAvg'] as num).toDouble(),
      humidity: (json['humidityAvg'] as num).toDouble(),
      windSpeed: (json['windSpeedAvg'] as num).toDouble(),
      precipitationProbability:
          (json['precipitationProbabilityAvg'] as num).toDouble(),
      weatherCodeMin: json['weatherCodeMin'] as int,
      weatherCodeMax: json['weatherCodeMax'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'precipitationProbability': precipitationProbability,
      'weatherCodeMin': weatherCodeMin,
      'weatherCodeMax': weatherCodeMax,
    };
  }

  WeatherValuesDaily toEntity() {
    return WeatherValuesDaily(
      temperature: temperature,
      humidity: humidity,
      windSpeed: windSpeed,
      precipitationProbability: precipitationProbability,
      weatherCodeMin: weatherCodeMin,
      weatherCodeMax: weatherCodeMax,
    );
  }

  @override
  List<Object?> get props => [
        temperature,
        humidity,
        windSpeed,
        precipitationProbability,
        weatherCodeMin,
        weatherCodeMax
      ];
}

class LocationModel extends Equatable {
  final double lat;
  final double lon;

  const LocationModel({required this.lat, required this.lon});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }

  Location toEntity() {
    return Location(
      lat: lat,
      lon: lon,
    );
  }

  @override
  List<Object?> get props => [lat, lon];
}
