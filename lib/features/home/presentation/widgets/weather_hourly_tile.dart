import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherHourlyTile extends StatelessWidget {
  final String temperature;
  final String iconUrl;
  final String time;

  const WeatherHourlyTile({
    super.key,
    required this.temperature,
    required this.iconUrl,
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
          Image.asset(
            iconUrl,
            width: 50.w,
            height: 50.w,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, color: Colors.white, size: 28.w),
          ),
          SizedBox(height: 4.h),
          Text(time, style: TextStyle(fontSize: 14.sp, color: Colors.white70)),
        ],
      ),
    );
  }
}
