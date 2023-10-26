import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherServices extends ChangeNotifier {
  final String APIKEY = "e17b7946bad84e9881752724232610";
  late String baseUrl =
      "http://api.weatherapi.com/v1/current.json?key=$APIKEY&q=";

  Future<WeatherModel?> getWeatherDetails(latitude, longitude) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl$latitude,$longitude&appid=$APIKEY&aqi=no'));
      log('$baseUrl$latitude,$longitude&appid=$APIKEY&aqi=no');
      var data = jsonDecode(response.body.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log("data ${data.toString()}");
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
}
