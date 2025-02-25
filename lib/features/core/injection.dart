import 'package:dio/dio.dart';
import 'package:driweather/features/home/domain/usecases/get_weather_realtime_by_location.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../home/data/datasources/weather_remote_datasource.dart';
import '../home/data/repositories/weather_repository_impl.dart';
import '../home/domain/repositories/weather_repository.dart';
import '../home/domain/usecases/get_weather_by_location.dart';
import '../home/presentation/bloc/weather/weather_bloc.dart';
// import 'api_client.dart';
import '../home/presentation/bloc/weather_realtime/weather_realtime_bloc.dart';
import 'router/app_router.dart';

final locator = GetIt.instance;

void init() {
  // Register Core Services
  locator.registerSingleton<AppRouter>(AppRouter());

  // Register Dio
  locator.registerSingleton<Dio>(Dio());
  // locator.registerSingleton<DioClient>(DioClient());

  locator.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  //BLOC
  locator.registerFactory(
    () => WeatherBloc(getForecastByLocation: locator()),
  );
  locator.registerFactory(
    () => WeatherRealtimeBloc(getRealtimeForecastByLocation: locator()),
  );

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(remoteDataSource: locator()),
  );

  // use case
  locator.registerLazySingleton(() => GetForecastByLocation(locator()));
  locator.registerLazySingleton(() => GetRealtimeForecastByLocation(locator()));

  // data sources
  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: locator()));
}
