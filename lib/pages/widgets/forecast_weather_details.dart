import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';

import '../../model/forecast_weather_model.dart';

class ForecastWeatherDetails extends StatelessWidget {
  final List<Hour> data;
  const ForecastWeatherDetails({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    int index = weatherController.currentHourIndex;
    return Consumer(builder: (context, provider, child) {
      log("relo");
      log("index $index");
      log("curr time ${data[index].time}");

      return SizedBox(
        width: MediaQuery.sizeOf(context).height / 2,
        height: MediaQuery.sizeOf(context).height / 2,
        child: Card(
          // color: Color.fromARGB(230, 170, 225, 238),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Weather Details",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Text(
                  "${DateFormat.jm().format(DateTime.parse(data[index].time))} to ${DateFormat.jm().format(DateTime.parse(data[index].time).add(const Duration(hours: 1)))}"),
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 3,
                // padding: const EdgeInsets.symmetric(vertical: 20)
                width: MediaQuery.sizeOf(context).height / 2,
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                  ),
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/icons/visibility.png", height: 40),
                        const Text("Visibility"),
                        const SizedBox(height: 10),
                        Text("${data[index].visKm} km")
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/icons/humidity.png", height: 40),
                        const Text("Humidity"),
                        const SizedBox(height: 10),
                        Text("${data[index].humidity}%")
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/weather_icons/wind.png",
                            height: 40),
                        // const Icon(Icons.air_rounded, size: 40),
                        const Text("Wind Speed"),
                        const SizedBox(height: 10),
                        Text("${data[index].windKph} km/s")
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/icons/barometer.png", height: 40),
                        // const Icon(Icons.sunny, size: 40),
                        const Text("Pressure"),
                        const SizedBox(height: 10),
                        Text("${data[index].pressureMb} mbar")
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.directions, size: 40),
                        const SizedBox(height: 2),
                        const Text("Wind Direction"),
                        const SizedBox(height: 10),
                        Text(data[index].windDir)
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/icons/cloud_cover.png", height: 40),
                        // const Icon(Icons.directions, size: 40),
                        const SizedBox(height: 2),
                        const Text("Cloud Cover"),
                        const SizedBox(height: 10),
                        Text("${data[index].cloud}%")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
