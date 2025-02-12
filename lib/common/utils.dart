import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'images.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class DateFormatter {
  /// Format panjang: "Friday, 13 September"
  static String formatToReadableDate(DateTime dateTime) {
    return DateFormat('EEEE, d MMMM').format(dateTime.toLocal());
  }

  /// Format pendek: "Sep, 13" dengan timezone lokal
  static String formatToShortDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString).toLocal();
    return DateFormat('MMM, d').format(dateTime);
  }

  static String formatToLocalTime(String utcDateTime) {
    DateTime dateTime = DateTime.parse(utcDateTime).toLocal();
    return DateFormat.Hm().format(dateTime); // Format "HH:mm" (24 jam)
  }
}

String getWeatherDescription({required int weatherCode}) {
  if (weatherCode == 1000) {
    return "Sunny"; // Langit cerah
  } else if (weatherCode == 1100) {
    return "Mostly Clear";
  } else if (weatherCode == 1101) {
    return "Partly Cloudy";
  } else if (weatherCode == 1102) {
    return "Mostly Cloudy";
  } else if (weatherCode == 1001) {
    return "Cloudy"; // Berawan
  } else if (weatherCode == 2000) {
    return "Fog";
  } else if (weatherCode == 2100) {
    return "Light Fog";
  } else if (weatherCode == 4000) {
    return "Drizzle";
  } else if (weatherCode == 4200) {
    return "Light Rain";
  } else if (weatherCode == 4001) {
    return "Rain";
  } else if (weatherCode == 4201) {
    return "Heavy Rain";
  } else if (weatherCode == 5000) {
    return "Snow";
  } else if (weatherCode == 5100) {
    return "Light Snow";
  } else if (weatherCode == 6000) {
    return "Freezing Drizzle";
  } else if (weatherCode == 6200) {
    return "Light Freezing Rain";
  } else if (weatherCode == 6001) {
    return "Freezing Rain";
  } else if (weatherCode == 6201) {
    return "Heavy Freezing Rain";
  } else if (weatherCode == 7000) {
    return "Ice Pellets";
  } else if (weatherCode == 7101) {
    return "Heavy Ice Pellets";
  } else if (weatherCode == 7102) {
    return "Light Ice Pellets";
  } else if (weatherCode == 8000) {
    return "Thunderstorm";
  }
  return "Unknown"; // Jika kode tidak ada di daftar
}

String getWeatherIcon(int weatherCode) {
  if (weatherCode == 1000) {
    return Images.sunnyIcon; // Cerah
  } else if (weatherCode == 1100 || weatherCode == 1101) {
    return Images.sunCloudyIcon; // Cerah berawan
  } else if (weatherCode == 1102 || weatherCode == 1001) {
    return Images.cloudyIcon; // Berawan
  } else if (weatherCode == 4000 ||
      weatherCode == 4200 ||
      weatherCode == 4001 ||
      weatherCode == 4201) {
    return Images.rainIcon; // Hujan ringan hingga deras
  } else if (weatherCode == 5000 ||
      weatherCode == 5100 ||
      weatherCode == 6000 ||
      weatherCode == 6200 ||
      weatherCode == 6001 ||
      weatherCode == 6201) {
    return Images
        .cloudyIcon; // Salju atau hujan es (Gunakan cloudy jika tidak ada icon khusus)
  } else if (weatherCode == 8000) {
    return Images.thunderIcon; // Badai petir
  }
  return Images.cloudyIcon; // Default icon jika tidak dikenali
}
