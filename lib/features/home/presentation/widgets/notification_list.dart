import 'package:flutter/material.dart';

import '../../../../common/constants.dart';
import 'notification_tile.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;
  const NotificationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> newNotifications = [];
    List<NotificationModel> earlierNotifications = [];

    for (var notif in notifications) {
      if (DateTime.now().difference(notif.timestamp).inHours < 24) {
        newNotifications.add(notif);
      } else {
        earlierNotifications.add(notif);
      }
    }

    return ListView(
      shrinkWrap: true,
      children: [
        if (newNotifications.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "New",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ...newNotifications
              .map((notif) => NotificationTile(notification: notif)),
        ],
        if (earlierNotifications.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Earlier",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ...earlierNotifications
              .map((notif) => NotificationTile(notification: notif)),
        ],
      ],
    );
  }
}
