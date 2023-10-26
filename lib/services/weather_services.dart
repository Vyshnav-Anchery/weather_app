import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

import '../model/forecast_weather_model.dart';

class WeatherServices extends ChangeNotifier {
  final String APIKEY = "e17b7946bad84e9881752724232610";
  late String baseUrl =
      "http://api.weatherapi.com/v1/current.json?key=$APIKEY&q=";
  late String forecastUrl =
      "http://api.weatherapi.com/v1/forecast.json?key=$APIKEY&q=";
  // 11.2479457,75.8337171&days=1&aqi=no&alerts=no

  Future<WeatherModel?> getWeatherDetails(latitude, longitude) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl$latitude,$longitude&aqi=no'));
      log('$baseUrl$latitude,$longitude&aqi=no');
      var data = jsonDecode(response.body.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return WeatherModel.fromJson(data);
      } else {
        return WeatherModel.fromJson(data);
      }
    } catch (e) {
      log("error ${e.toString()}");
      return null;
    }
  }

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<ForeCastWeatherModel?> getForecastWeather(
      {latitude, longitude, date}) async {
    try {
      final response = await http.get(Uri.parse(
          '$forecastUrl$latitude,$longitude&days=$date&aqi=no&alerts=no'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ForeCastWeatherModel.fromJson(data);
      } else {
        return ForeCastWeatherModel.fromJson(data);
      }
    } catch (e) {
      log("error ${e.toString()}");
      return null;
    }
  }
}
