part of 'weather_realtime_bloc.dart';

class WeatherRealtimeState extends Equatable {
  const WeatherRealtimeState();

  @override
  List<Object> get props => [];
}

class WeatherRealtimeInitial extends WeatherRealtimeState {}

class WeatherRealtimeLoading extends WeatherRealtimeState {}

class WeatherRealtimeLoaded extends WeatherRealtimeState {
  final WeatherRealtimeEntity weatherRealtime;

  const WeatherRealtimeLoaded(this.weatherRealtime);

  @override
  List<Object> get props => [weatherRealtime];
}

class WeatherRealtimeError extends WeatherRealtimeState {
  final String message;

  const WeatherRealtimeError(this.message);

  @override
  List<Object> get props => [message];
}
