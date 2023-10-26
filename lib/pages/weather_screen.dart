import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/widgets/weather_details.dart';

import '../services/weather_Services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherServicesController weatherProvider =
        Provider.of<WeatherServicesController>(context);
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 113, 162, 245),
      body: FutureBuilder<WeatherModel?>(
        future: weatherProvider.getWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text("Error..!!"),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(snapshot.data!.name.toString(),
                          style: const TextStyle(fontSize: 25)),
                      // Text(","),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          " , ${snapshot.data!.sys!.country}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    weatherController
                        .imageAssign(snapshot.data!.weather![0].icon!),
                    height: MediaQuery.sizeOf(context).height / 3,
                    width: MediaQuery.sizeOf(context).width / 1.5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${snapshot.data!.main!.temp} °C",
                    style: GoogleFonts.barlowCondensed(fontSize: 40),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    snapshot.data!.weather![0].main!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10),
                  WeatherDetails(data: snapshot.data!)
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
