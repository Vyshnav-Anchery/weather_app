import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherServicesController extends ChangeNotifier {
  static const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String APIKEY = "4788615dd3313719839bb9b01007cce5";
  // WeatherServices(this.APIKEY);

  Future<WeatherModel?> getWeather() async {
    Position position = await getCurrentCity();
    log(position.toString());
    try {
      final currentWeather =
          await getWeatherDetails(position.latitude, position.longitude);
      return currentWeather;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<WeatherModel?> getWeatherDetails(latitude, longitude) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseUrl?lat=$latitude&lon=$longitude&appid=$APIKEY&units=metric'));
      log(response.statusCode.toString());
      var data = jsonDecode(response.body.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log("data ${data.toString()}");
        return WeatherModel.fromJson(data);
      } else {
        return WeatherModel.fromJson(data);
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  getCurrentCity() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
