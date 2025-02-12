enum WeatherIconType {
  sunny,
  rain,
  cloudy,
}

extension WeatherIconExtension on WeatherIconType {
  String get assetPath {
    switch (this) {
      case WeatherIconType.sunny:
        return "assets/icons/sunny.png";
      case WeatherIconType.rain:
        return "assets/icons/rainy.png";
      case WeatherIconType.cloudy:
        return "assets/icons/windy-gray.png";
    }
  }
}

class NotificationModel {
  final String title;
  final String time;
  final DateTime timestamp;
  final bool isRead;
  final String subtitle;
  final WeatherIconType iconType;

  NotificationModel({
    required this.title,
    required this.time,
    required this.timestamp,
    required this.isRead,
    required this.subtitle,
    required this.iconType,
  });
}

class NotificationConstants {
  static final DateTime now = DateTime.now();

  static final List<NotificationModel> notifications = [
    NotificationModel(
      title:
          "A sunny day in your location, consider wearing your UV protection",
      time: "10 minutes ago",
      timestamp: now.subtract(Duration(minutes: 10)),
      isRead: false,
      subtitle: "New",
      iconType: WeatherIconType.sunny,
    ),
    NotificationModel(
      title:
          "A cloudy day will occur all day long, don't worry about the heat of the sun",
      time: "1 day ago",
      timestamp: now.subtract(Duration(days: 1)),
      isRead: true,
      subtitle: "Earlier",
      iconType: WeatherIconType.cloudy,
    ),
    NotificationModel(
      title:
          "Potential for rain today is 84%, don't forget to bring your umbrella.",
      time: "2 day ago",
      timestamp: now.subtract(Duration(days: 2)),
      isRead: true,
      subtitle: "New",
      iconType: WeatherIconType.rain,
    ),
  ];
}

// class WeatherData {
//   final String time;
//   final double temperature;
//   final int humidity;

//   WeatherData({
//     required this.time,
//     required this.temperature,
//     required this.humidity,
//   });
// }

// class WeatherConstants {
//   static List<WeatherData> hourlyData = [
//     WeatherData(time: "2025-02-11T09:00:00Z", temperature: -9.4, humidity: 79),
//     WeatherData(time: "2025-02-11T10:00:00Z", temperature: -9.2, humidity: 69),
//     WeatherData(time: "2025-02-11T11:00:00Z", temperature: -8.5, humidity: 65),
//     WeatherData(time: "2025-02-11T12:00:00Z", temperature: -7.9, humidity: 60),
//     WeatherData(time: "2025-02-11T13:00:00Z", temperature: -6.8, humidity: 55),
//   ];

//   static List<WeatherData> dailyData = [
//     WeatherData(time: "2025-02-07", temperature: -12.3, humidity: 82),
//     WeatherData(time: "2025-02-08", temperature: -10.5, humidity: 78),
//     WeatherData(time: "2025-02-09", temperature: -9.8, humidity: 74),
//     WeatherData(time: "2025-02-10", temperature: -8.2, humidity: 70),
//     WeatherData(time: "2025-02-11", temperature: -7.5, humidity: 66),
//   ];
// }
