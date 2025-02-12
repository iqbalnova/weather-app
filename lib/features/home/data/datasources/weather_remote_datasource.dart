import 'package:dio/dio.dart';

import '../../../../common/exception.dart';
import '../models/weather_response.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponse> getForecastByLocation({
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
}
