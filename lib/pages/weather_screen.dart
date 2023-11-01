import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/pages/widgets/search_delegate.dart';
import 'package:weather_app/pages/widgets/today_forecast.dart';
import 'widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context, listen: false);
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 51, 28, 113),
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
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => showSearch(
                                    context: context,
                                    delegate: CustomSearchDelegate()),
                                icon: const Icon(
                                  Icons.search,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () => setState(() {}),
                                icon: const Icon(
                                  Icons.refresh,
                                  size: 30,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    WeatherCard(data: snapshot.data!),
                    const SizedBox(height: 20),
                    // const SizedBox(height: 10),
                    const Text("Today's Forecast",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left),
                    const SizedBox(height: 10),
                    const TodayForecast(),
                    // WeatherDetails(data: snapshot.data!)
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
