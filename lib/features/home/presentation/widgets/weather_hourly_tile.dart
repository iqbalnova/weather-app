import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherHourlyTile extends StatelessWidget {
  final String temperature;
  final IconData icon;
  final String time;

  const WeatherHourlyTile({
    super.key,
    required this.temperature,
    required this.icon,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(temperature,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          SizedBox(height: 4.h),
          Icon(icon, size: 28.w, color: Colors.white),
          SizedBox(height: 4.h),
          Text(time, style: TextStyle(fontSize: 14.sp, color: Colors.white70)),
        ],
      ),
    );
  }
}
