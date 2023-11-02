import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/search_model.dart';
import 'package:weather_app/services/weather_Services.dart';
import '../model/weather_model.dart';

class WeatherController extends ChangeNotifier {
  WeatherServices weatherServices = WeatherServices();
  TextEditingController searchController = TextEditingController();
  double? latitude;
  double? longitude;
  Future<WeatherModel?> getWeather() async {
    try {
      if (latitude == null && longitude == null) {
        getCurrentLocation();
      }
      final currentWeather =
          weatherServices.getWeatherDetails(latitude, longitude);
      return currentWeather;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<SearchModel>> searchLocation(String name) {
    return weatherServices.getSuggestions(name);
  }

  void getCurrentLocation() async {
    Position position = await weatherServices.getCurrentLocation();
    latitude = position.latitude;
    longitude = position.longitude;
    log(position.toString());
    notifyListeners();
  }

  assignLocation({lat, long}) {
    latitude = lat;
    longitude = long;
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}
