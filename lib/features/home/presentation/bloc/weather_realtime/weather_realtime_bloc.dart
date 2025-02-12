import 'package:bloc/bloc.dart';
import 'package:driweather/features/home/domain/entities/weather_realtime_entities.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_weather_realtime_by_location.dart';

part 'weather_realtime_event.dart';
part 'weather_realtime_state.dart';

class WeatherRealtimeBloc
    extends Bloc<WeatherRealtimeEvent, WeatherRealtimeState> {
  final GetRealtimeForecastByLocation getRealtimeForecastByLocation;

  WeatherRealtimeBloc({required this.getRealtimeForecastByLocation})
      : super(WeatherRealtimeInitial()) {
    on<FetchWeatherRealtimeEvent>((event, emit) async {
      emit(WeatherRealtimeLoading());
      final result = await getRealtimeForecastByLocation.execute(
          lat: event.lat, lon: event.lon);
      result.fold(
        (failure) => emit(WeatherRealtimeError(failure.message)),
        (weather) => emit(WeatherRealtimeLoaded(weather)),
      );
    });
  }
}
