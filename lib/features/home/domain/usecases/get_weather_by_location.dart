import 'package:dartz/dartz.dart';

import '../../../../common/failure.dart';
import '../entities/weather_entities.dart';
import '../repositories/weather_repository.dart';

class GetForecastByLocation {
  final WeatherRepository repository;

  GetForecastByLocation(this.repository);

  Future<Either<Failure, WeatherData>> execute({
    required double lat,
    required double lon,
  }) {
    return repository.getForecastByLocation(lat: lat, lon: lon);
  }
}
