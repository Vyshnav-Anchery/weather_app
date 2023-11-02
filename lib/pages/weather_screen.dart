import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/forecast_weather_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/pages/widgets/search_delegate.dart';
import 'package:weather_app/pages/widgets/today_forecast.dart';
import 'package:weather_app/utils/constants/constants.dart';
import 'widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 51, 28, 113),
      body: Consumer<WeatherController>(
          builder: (context, weatherController, child) {
        return FutureBuilder<WeatherModel?>(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Consumer<ForecastController>(
                              builder: (context, forecastController, child) {
                            return FutureBuilder(
                              future: forecastController.forecastWeather(
                                  3,
                                  snapshot.data!.location!.lat!,
                                  snapshot.data!.location!.lon!),
                              builder: (context, forecastSnapshot) {
                                if (forecastSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                } else if (forecastSnapshot.data == null ||
                                    !forecastSnapshot.hasData) {
                                  return Container();
                                } else {
                                  return DropdownButton(
                                    iconEnabledColor: Colors.white,
                                    underline: Container(),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Constants.cardBg,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17),
                                    value: forecastSnapshot
                                        .data!.forecast.forecastday[0].date,
                                    items: forecastSnapshot
                                        .data!.forecast.forecastday
                                        .map((e) => DropdownMenuItem(
                                            alignment: Alignment.center,
                                            value: e.date,
                                            child: Text(e.date)))
                                        .toList(),
                                    onChanged: (value) {
                                      log(DateFormat("yyyy-MM-dd")
                                          .format(DateTime.now()));
                                      log(value.toString());
                                    },
                                  );
                                }
                              },
                            );
                          }),
                          const Text("Forecast Weather",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.left),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TodayForecast(
                        lat: snapshot.data!.location!.lat!,
                        long: snapshot.data!.location!.lon!,
                      ),
                      // WeatherDetails(data: snapshot.data!)
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
