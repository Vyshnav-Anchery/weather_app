import 'dart:developer';

import 'package:flutter/widgets.dart';

class WeatherController extends ChangeNotifier {
  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '$hours:${minutes.toString().padLeft(2, '0')}';
  }

  String imageAssign(String icon) {
    log(icon);
    switch (icon) {
      case "01d" :
        return "assets/pngs/clear_sky.png";
      case "01n" :
        return "assets/pngs/clear_night.png";
      case "02d":
        return "assets/pngs/few_clouds.png";
      case "02n":
        return "assets/pngs/cloud_night.png";
      case "03d" || "03n":
        return "assets/pngs/cloudy.png";
      case "04d" || "04n":
        return "assets/pngs/broken_clouds.png";
      case "09d":
        return "assets/pngs/shower_rain.png";
      case "10d":
        return "assets/pngs/rain.png";
      case "11d":
        return "assets/pngs/thunderstorm.png";
      case "13d":
        return "assets/pngs/snow.png";
      default:
        return "assets/pngs/mist.png";
    }
  }

  DateTime convertUnixTimestampToIST(int unixTimestamp) {
  DateTime utcTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000, isUtc: true);
  Duration offset = const Duration(hours: 5, minutes: 30); // IST offset is 5 hours and 30 minutes
  DateTime istTime = utcTime.add(offset);
  return istTime;
}

}
