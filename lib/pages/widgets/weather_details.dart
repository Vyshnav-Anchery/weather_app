import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';

class WeatherDetails extends StatelessWidget {
  final data;

  const WeatherDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3,
      width: MediaQuery.sizeOf(context).height / 2,
      child: Card(
        // color: Color.fromARGB(230, 170, 225, 238),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          width: MediaQuery.sizeOf(context).height / 3,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 30, crossAxisCount: 3),
            children: [
              Column(
                children: [
                  const Icon(Icons.remove_red_eye_outlined, size: 40),
                  const Text("Visibility"),
                  const SizedBox(height: 10),
                  Text("${data.current!.visKm} km")
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.ac_unit, size: 40),
                  const Text("Humidity"),
                  const SizedBox(height: 10),
                  Text("${data.current!.humidity}%")
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.air_rounded, size: 40),
                  const Text("Wind"),
                  const SizedBox(height: 10),
                  Text("${data.current!.windKph} km/s")
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.sunny, size: 40),
                  const Text("Sunrise"),
                  const SizedBox(height: 10),
                  Text("${data.current!.humidity} AM")
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.sunny_snowing, size: 40),
                  const Text("Sunset"),
                  const SizedBox(height: 10),
                  Text("${data.current!.gustKph} PM")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
