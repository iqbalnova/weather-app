import 'package:flutter/material.dart';

import '../../../../common/styles.dart';

class WeatherHeaderWidget extends StatelessWidget {
  final String cityName;
  final VoidCallback onLocationTap;
  final VoidCallback onNotificationTap;
  final bool hasNotification;

  const WeatherHeaderWidget({
    super.key,
    required this.cityName,
    required this.onLocationTap,
    required this.onNotificationTap,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onLocationTap,
            child: Row(
              children: [
                Icon(Icons.location_on, color: whiteColor),
                SizedBox(width: 8),
                Text(
                  cityName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, color: whiteColor),
              ],
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: onNotificationTap,
                icon: Icon(Icons.notifications, color: whiteColor),
              ),
              if (hasNotification)
                Positioned(
                  right: 12,
                  top: 10,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: redColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
