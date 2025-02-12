import 'package:dio/dio.dart';
import 'package:driweather/features/home/data/models/weather_realtime_response.dart';

import '../../../../common/exception.dart';
import '../models/weather_response.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponse> getForecastByLocation({
    required double lat,
    required double lon,
  });
  Future<WeatherRealtimeResponse> getRealtimeForecastByLocation({
    required double lat,
    required double lon,
  });
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  static const String apiKey = '4elX12aRlLtomNQjHr3kVwwygZWpu9WB';
  static const String baseUrl = 'https://api.tomorrow.io/v4/weather';

  final Dio client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherResponse> getForecastByLocation({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await client.get(
        '$baseUrl/forecast',
        queryParameters: {
          'location': '$lat,$lon',
          'apikey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final weatherResponse = WeatherResponse.fromJson(response.data);

        return weatherResponse;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<WeatherRealtimeResponse> getRealtimeForecastByLocation({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await client.get(
        '$baseUrl/realtime',
        queryParameters: {
          'location': '$lat,$lon',
          'apikey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final weatherRealtimeResponse =
            WeatherRealtimeResponse.fromJson(response.data);

        return weatherRealtimeResponse;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
