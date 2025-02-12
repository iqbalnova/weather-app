import 'package:dartz/dartz.dart';

import '../../../../common/failure.dart';
import '../entities/weather_entities.dart';
import '../entities/weather_realtime_entities.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherData>> getForecastByLocation({
    required double lat,
    required double lon,
  });
  Future<Either<Failure, WeatherRealtimeEntity>> getRealtimeForecastByLocation({
    required double lat,
    required double lon,
  });
}
