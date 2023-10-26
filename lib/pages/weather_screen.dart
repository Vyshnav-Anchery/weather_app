import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/widgets/today_forecast.dart';
import 'package:weather_app/utils/widgets/weather_details.dart';
import '../services/weather_Services.dart';
import '../utils/widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WeatherServices weatherProvider = Provider.of<WeatherServices>(context);
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 28, 113),
      body: FutureBuilder<WeatherModel?>(
        future: weatherController.getWeather(),
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
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 30,
                              // color: Colors.black,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(snapshot.data!.location!.country!),
                                    Text(
                                        " , ${snapshot.data!.location!.region}"),
                                  ],
                                ),
                                Text(snapshot.data!.location!.name!,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.refresh,
                              size: 30,
                            ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    WeatherCard(data: snapshot.data!),
                    const SizedBox(height: 20),
                    // const SizedBox(height: 10),
                    const Text("Forecast", style: TextStyle(fontSize: 20)),
                    TodayForecast(),
                    // const SizedBox(height: 10),
                    WeatherDetails(data: snapshot.data!)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
