import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';

import '../../model/weather_model.dart';

class WeatherDetails extends StatelessWidget {
  final WeatherModel data;

  const WeatherDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    DateTime sunRise =
        weatherController.convertUnixTimestampToIST(data.sys!.sunrise!);
    DateTime sunSet =
        weatherController.convertUnixTimestampToIST(data.sys!.sunset!);
    log(sunSet.toString());
    return Card(
      color: Color.fromARGB(230, 170, 225, 238),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        height: MediaQuery.sizeOf(context).height / 3,
        width: MediaQuery.sizeOf(context).height / 3,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 30,
              crossAxisCount: 3),
          children: [
            Column(
              children: [
                const Icon(Icons.remove_red_eye_outlined, size: 40),
                const Text("Visibility"),
                const SizedBox(height: 10),
                Text("${data.visibility! / 1000} km")
              ],
            ),
            Column(
              children: [
                const Icon(Icons.ac_unit, size: 40),
                const Text("Humidity"),
                const SizedBox(height: 10),
                Text("${data.main!.humidity}%")
              ],
            ),
            Column(
              children: [
                const Icon(Icons.air_rounded, size: 40),
                const Text("Wind"),
                const SizedBox(height: 10),
                Text("${data.wind!.speed} m/s")
              ],
            ),
            Column(
              children: [
                const Icon(Icons.sunny, size: 40),
                const Text("Sunrise"),
                const SizedBox(height: 10),
                Text("${sunRise.hour}:${sunRise.minute} AM")
              ],
            ),
            Column(
              children: [
                const Icon(Icons.sunny_snowing, size: 40),
                const Text("Sunset"),
                const SizedBox(height: 10),
                Text("${sunSet.hour - 12}:${sunSet.minute} PM")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
