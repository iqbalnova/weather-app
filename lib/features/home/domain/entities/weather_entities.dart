import 'package:equatable/equatable.dart';

class WeatherData extends Equatable {
  final List<HourlyWeather> hourly;
  final List<DailyWeather> daily;
  final Location location;

  const WeatherData({
    required this.hourly,
    required this.daily,
    required this.location,
  });

  @override
  List<Object?> get props => [hourly, daily, location];
}

// 🌤️ Model untuk Hourly Weather
class HourlyWeather extends Equatable {
  final String time;
  final WeatherValuesHourly values;

  const HourlyWeather({
    required this.time,
    required this.values,
  });

  @override
  List<Object?> get props => [time, values];
}

// 🌤️ Model untuk Daily Weather
class DailyWeather extends Equatable {
  final String time;
  final WeatherValuesDaily values;

  const DailyWeather({
    required this.time,
    required this.values,
  });

  @override
  List<Object?> get props => [time, values];
}

// 🌡️ Model untuk Values di Hourly
class WeatherValuesHourly extends Equatable {
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double precipitationProbability;
  final int weatherCode;

  const WeatherValuesHourly({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.precipitationProbability,
    required this.weatherCode,
  });

  @override
  List<Object?> get props => [
        temperature,
        humidity,
        windSpeed,
        precipitationProbability,
        weatherCode,
      ];
}

// 🌡️ Model untuk Values di Daily
class WeatherValuesDaily extends Equatable {
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double precipitationProbability;
  final int weatherCodeMin;
  final int weatherCodeMax;

  const WeatherValuesDaily({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.precipitationProbability,
    required this.weatherCodeMin,
    required this.weatherCodeMax,
  });

  @override
  List<Object?> get props => [
        temperature,
        humidity,
        windSpeed,
        precipitationProbability,
        weatherCodeMin,
        weatherCodeMax,
      ];
}

// 📍 Model untuk Location
class Location extends Equatable {
  final double lat;
  final double lon;

  const Location({required this.lat, required this.lon});

  @override
  List<Object?> get props => [lat, lon];
}
