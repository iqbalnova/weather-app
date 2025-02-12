import 'package:dartz/dartz.dart';

import '../../../../common/failure.dart';
import '../entities/weather_entities.dart';

abstract class MovieRepository {
  Future<Either<Failure, WeatherData>> getForecastByLocation();
}
