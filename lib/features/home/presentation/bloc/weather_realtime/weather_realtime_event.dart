part of 'weather_realtime_bloc.dart';

class WeatherRealtimeEvent extends Equatable {
  const WeatherRealtimeEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherRealtimeEvent extends WeatherRealtimeEvent {
  final double lat;
  final double lon;

  const FetchWeatherRealtimeEvent({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}
