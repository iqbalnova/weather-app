import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/images.dart';
import '../../../../common/styles.dart';
import '../../../core/router/app_routes.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  OnboardPageState createState() => OnboardPageState();
}

class OnboardPageState extends State<OnboardPage> {
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
                colors: [Color(0xff4A91FF), Color(0xffFFFFFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              Images.bgCircle,
              width: 400.w,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 30,
            child: Image.asset(
              Images.halfSun,
              width: 80.w,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 100,
            right: 0,
            child: Image.asset(
              Images.halfCloud,
              width: 280.w,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Never get caught in the rain again",
                  textAlign: TextAlign.start,
                  style: semiBoldStyle.copyWith(fontSize: 30.sp),
                ),
                SizedBox(height: 10),
                Text(
                  "Stay ahead of the weather with our accurate forecasts",
                  textAlign: TextAlign.start,
                  style: greyTextStyle,
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black45,
                    ),
                    child: Text(
                      "Get Started",
                      style: semiBoldStyle.copyWith(color: Color(0xff444E72)),
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
