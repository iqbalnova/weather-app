import 'package:equatable/equatable.dart';

import '../../domain/entities/weather_entities.dart';
import 'weather_model.dart';

class WeatherResponse extends Equatable {
  final List<HourlyWeatherModel> hourly;
  final List<DailyWeatherModel> daily;
  final LocationModel location;

  const WeatherResponse({
    required this.hourly,
    required this.daily,
    required this.location,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      hourly: List<HourlyWeatherModel>.from(
          (json['timelines']['hourly'] as List)
              .take(4)
              .map((x) => HourlyWeatherModel.fromJson(x))),
      daily: (json['timelines']['daily'] as List?)
              ?.map((x) => DailyWeatherModel.fromJson(x))
              .toList() ??
          [],
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() => {
        'timelines': {
          'hourly': List<dynamic>.from(hourly.map((x) => x.toJson())),
          'daily': List<dynamic>.from(daily.map((x) => x.toJson())),
        },
        'location': location.toJson(),
      };

  WeatherData toEntity() {
    return WeatherData(
      hourly: hourly.map((h) => h.toEntity()).toList(),
      daily: daily.map((d) => d.toEntity()).toList(),
      location: location.toEntity(),
    );
  }

  @override
  List<Object> get props => [hourly, daily, location];
}
