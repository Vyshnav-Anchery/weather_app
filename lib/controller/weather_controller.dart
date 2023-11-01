import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/forecast_weather_model.dart';
import 'package:weather_app/model/search_model.dart';
import 'package:weather_app/services/weather_Services.dart';
import '../model/weather_model.dart';

class WeatherController extends ChangeNotifier {
  late ScrollController forecastScrollController;
  int currentHourIndex = 0;
  WeatherServices weatherServices = WeatherServices();
  TextEditingController searchController = TextEditingController();

  Future<WeatherModel?> getWeather() async {
    Position position =await weatherServices.getCurrentLocation();
    log(position.toString());
    try {
      final currentWeather = weatherServices.getWeatherDetails(
          position.latitude, position.longitude);
      return currentWeather;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  changeIndex(int index) {
    currentHourIndex = index;
    // scrollToCurrentHour(hourlyData: hourlyData, cardWidth: cardWidth);
    notifyListeners();
  }

  Future<ForeCastWeatherModel?> forecastWeather(int date) async {
    Position position = await weatherServices.getCurrentLocation();
    try {
      final currentWeather = await weatherServices.getForecastWeather(
          latitude: position.latitude,
          longitude: position.longitude,
          date: date);
      return currentWeather;
    } catch (e) {
      log("catch ${e.toString()}");
    }
    return null;
  }

  void scrollToCurrentHour({required hourlyData, required double cardWidth}) {
    final now = DateTime.now();
    for (int i = 0; i < hourlyData.length; i++) {
      final apiHourlyData = DateTime.parse(hourlyData[i].time);
      if (apiHourlyData.day == now.day && apiHourlyData.hour == now.hour) {
        currentHourIndex = i;
        forecastScrollController =
            ScrollController(initialScrollOffset: i * cardWidth);
        log(currentHourIndex.toString());
        break;
      }
    }
  }

  Future<List<SearchModel>> searchLocation(String name) {
    return weatherServices.getSuggestions(name);
  }
}
