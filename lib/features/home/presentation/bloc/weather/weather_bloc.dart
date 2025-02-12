import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/weather_entities.dart';
import '../../../domain/usecases/get_weather_by_location.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetForecastByLocation getForecastByLocation;

  WeatherBloc({required this.getForecastByLocation}) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final result =
          await getForecastByLocation.execute(lat: event.lat, lon: event.lon);
      result.fold(
        (failure) => emit(WeatherError(failure.message)),
        (weather) => emit(WeatherLoaded(weather)),
      );
    });
  }
}
