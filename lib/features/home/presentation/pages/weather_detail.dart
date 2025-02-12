import 'package:driweather/features/core/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/images.dart';
import '../bloc/weather/weather_bloc.dart';
import '../widgets/weather_daily_tile.dart';
import '../widgets/weather_hourly_tile.dart';

class WeatherDetailPage extends StatefulWidget {
  final double lat;
  final double lon;
  final GetIt locator;

  const WeatherDetailPage(
      {super.key, required this.lat, required this.lon, required this.locator});

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 24.w),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🔹 Background Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff47BFDF), Color(0xff4A91FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Positioned(
            left: 0,
            child: Image.asset(
              Images.bgWeatherLeft,
              width: 100.w,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              Images.bgWeatherRight,
              width: 260.w,
              fit: BoxFit.contain,
            ),
          ),

          SafeArea(
            child: BlocProvider(
              create: (context) => locator<WeatherBloc>()
                ..add(
                  FetchWeatherEvent(lat: widget.lat, lon: widget.lon),
                ),
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WeatherLoaded) {
                    final weatherData = state.weather;
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Feb, 11",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            height: 140.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemCount: weatherData.hourly.length,
                              itemBuilder: (context, index) {
                                final weather = weatherData.hourly[index];
                                return WeatherHourlyTile(
                                  temperature: "${weather.values.temperature}°",
                                  icon: Icons.wb_sunny,
                                  time: weather.time.substring(11, 16),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              "Next Forecast",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            itemCount: weatherData.daily.length,
                            itemBuilder: (context, index) {
                              final weather = weatherData.daily[index];
                              return WeatherDailyTile(
                                date: weather.time,
                                icon: Icons.cloud,
                                temperature: "${weather.values.temperature}°",
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else if (state is WeatherError) {
                    return Center(
                        child: Text(
                            'Oops, something went wrong. Please ry again later!',
                            style: TextStyle(color: Colors.white)));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
