import 'package:driweather/features/home/presentation/widgets/map_picker.dart';
import 'package:flutter/material.dart';

import '../../home/presentation/pages/onboard.dart';
import '../../home/presentation/pages/weather.dart';
import '../../home/presentation/pages/weather_detail.dart';
import 'app_routes.dart';
import '../injection.dart' as di;

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Builder(
        builder: (BuildContext context) {
          switch (settings.name) {
            case AppRoutes.onboard:
              return const OnboardPage();
            case AppRoutes.home:
              return const WeatherPage();
            case AppRoutes.weatherDetail:
              final Map<String, dynamic> arguments =
                  settings.arguments as Map<String, dynamic>;
              final double lat = arguments['lat'];
              final double lon = arguments['lon'];

              return WeatherDetailPage(
                lat: lat,
                lon: lon,
                locator: di.locator,
              );
            case AppRoutes.mapPicker:
              return const MapPickerPage();
            default:
              return const Scaffold(
                body: Center(
                  child: Text(
                    'Page not found :(',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              );
          }
        },
      );
    });
  }
}
