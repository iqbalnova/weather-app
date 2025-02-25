import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:driweather/features/home/domain/entities/weather_realtime_entities.dart';

import '../../../../common/exception.dart';
import '../../../../common/failure.dart';
import '../../domain/entities/weather_entities.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherData>> getForecastByLocation({
    required double lat,
    required double lon,
  }) async {
    try {
      final weatherData = await remoteDataSource.getForecastByLocation(
        lat: lat,
        lon: lon,
      );
      return Right(weatherData.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, WeatherRealtimeEntity>> getRealtimeForecastByLocation({
    required double lat,
    required double lon,
  }) async {
    try {
      final weatherRealtimeData =
          await remoteDataSource.getRealtimeForecastByLocation(
        lat: lat,
        lon: lon,
      );
      return Right(weatherRealtimeData.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
