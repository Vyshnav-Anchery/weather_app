import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:weather_app/controller/dropdown_button_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/services/weather_Services.dart';

import '../model/forecast_weather_model.dart';

class ForecastController extends ChangeNotifier {
  late ScrollController forecastScrollController;
  DropDownButtonController dropDownButtonController =
      DropDownButtonController();
  WeatherServices weatherServices = WeatherServices();
  WeatherController weatherController = WeatherController();
  int currentHourIndex = 0;
  Future<ForeCastWeatherModel?> forecastWeather(
      int date, double lat, double long) async {
    try {
      final currentWeather = await weatherServices.getForecastWeather(
          latitude: lat, longitude: long, date: date);
      return currentWeather;
    } catch (e) {
      log("catch ${e.toString()}");
    }
    return null;
  }

  changeIndex(int index) {
    currentHourIndex = index;
    // scrollToCurrentHour(hourlyData: hourlyData, cardWidth: cardWidth);
    notifyListeners();
  }

  void scrollToCurrentHour(
      {required List<Hour> hourlyData,
      required double cardWidth,
      required DateTime timeNow}) {
    for (int i = 0; i < hourlyData.length; i++) {
      final apiHourlyData = DateTime.parse(hourlyData[i].time);
      if (apiHourlyData.day == timeNow.day &&
          apiHourlyData.hour == timeNow.hour) {
        currentHourIndex = i;
        forecastScrollController =
            ScrollController(initialScrollOffset: i * cardWidth);
        
        break;
      }
    }
  }
}
