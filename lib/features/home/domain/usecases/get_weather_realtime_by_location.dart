import 'package:dartz/dartz.dart';

import '../../../../common/failure.dart';
import '../entities/weather_realtime_entities.dart';
import '../repositories/weather_repository.dart';

class GetRealtimeForecastByLocation {
  final WeatherRepository repository;

  GetRealtimeForecastByLocation(this.repository);

  Future<Either<Failure, WeatherRealtimeEntity>> execute({
    required double lat,
    required double lon,
  }) {
    return repository.getRealtimeForecastByLocation(lat: lat, lon: lon);
  }
}
