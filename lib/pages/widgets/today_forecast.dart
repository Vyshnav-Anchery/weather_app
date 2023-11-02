import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/widgets/forecast_weather_details.dart';

import '../../controller/forecast_weather_controller.dart';
// import 'forecast_listview.dart';

class TodayForecast extends StatelessWidget {
  final double lat;
  final double long;

  const TodayForecast({super.key, required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    ForecastController forecastController =
        Provider.of<ForecastController>(context, listen: false);
    return FutureBuilder(
        future: forecastController.forecastWeather(1, lat, long),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text("Error Getting data..!!"),
            );
          } else {
            var forecastData = snapshot.data!.forecast.forecastday[0].hour;
            forecastController.scrollToCurrentHour(
                timeNow: DateTime.parse(snapshot.data!.location.localtime),
                hourlyData: forecastData,
                cardWidth: MediaQuery.sizeOf(context).height / 9);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).height / 2,
                  height: MediaQuery.sizeOf(context).height / 6,
                  child: ListView.builder(
                    controller: forecastController.forecastScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: forecastData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        // height: MediaQuery.sizeOf(context).height / 9,
                        width: MediaQuery.sizeOf(context).height / 9,
                        child: GestureDetector(
                          onTap: () {
                            forecastController.changeIndex(index);
                            // log(weatherController.currentHourIndex.toString());
                          },
                          child: Consumer<ForecastController>(
                              builder: (context, forecastController, child) {
                            return Card(
                              color:
                                  index == forecastController.currentHourIndex
                                      ? const Color.fromARGB(230, 170, 225, 238)
                                      : null,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Text(forecastData[index].time!.substring(10)),
                                  Text(DateFormat.jm().format(DateTime.parse(
                                      forecastData[index].time))),
                                  Image.network(
                                      "https:${forecastData[index].condition.icon}"),
                                  Text("${forecastData[index].tempC} °C")
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                ForecastWeatherDetails(data: forecastData),
              ],
            );
          }
        });
  }
}
