import '../../../../common/constants.dart';
import '../../../../common/styles.dart';
import '../widgets/weather_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/images.dart';
import '../../../core/router/app_routes.dart';
import '../widgets/notification_list.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  void _showNotificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Your notification",
                  style: boldStyle,
                ),
              ),
              Expanded(
                child: NotificationList(
                  notifications: NotificationConstants.notifications,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Spacer(),
                SafeArea(
                  child: WeatherHeaderWidget(
                    cityName: "Jakarta",
                    onLocationTap: () => {},
                    onNotificationTap: () =>
                        _showNotificationBottomSheet(context),
                    hasNotification: true,
                  ),
                ),
                Image.asset(
                  Images.cloudy,
                  width: 240.w,
                  fit: BoxFit.contain,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: whiteColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Today, 12 September',
                        style: whiteTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text('29°',
                          style: whiteTextStyle.copyWith(
                              fontSize: 60.sp, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      Text(
                        'Cloudy',
                        style: semiBoldStyle.copyWith(
                            color: whiteColor, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.windIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          Text(
                            "Wind",
                            style: whiteTextStyle,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "|",
                            style: whiteTextStyle,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "10 km/h",
                            style: whiteTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.humidityIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          Text(
                            "Hum",
                            style: whiteTextStyle,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "|",
                            style: whiteTextStyle,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "54%",
                            style: whiteTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200.w,
                  margin: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.weatherDetail,
                          arguments: {'lon': -71.0466, 'lat': 42.3478});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black45,
                    ),
                    child: Text(
                      "Weather Details",
                      style: semiBoldStyle.copyWith(color: Color(0xff444E72)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
