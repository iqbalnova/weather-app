import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils.dart';

class WeatherDailyTile extends StatelessWidget {
  final String date;
  final String iconUrl;
  final String temperature;

  const WeatherDailyTile({
    super.key,
    required this.date,
    required this.iconUrl,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormatter.formatToShortDate(date),
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
          Image.asset(
            iconUrl,
            width: 60.w,
            height: 60.w,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, color: Colors.white, size: 28.w),
          ),
          Text(
            temperature,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
