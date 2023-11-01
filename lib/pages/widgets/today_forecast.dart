import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/pages/widgets/forecast_weather_details.dart';
// import 'forecast_listview.dart';

class TodayForecast extends StatelessWidget {
  const TodayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context, listen: false);
    return FutureBuilder(
        future: weatherController.forecastWeather(1),
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
            weatherController.scrollToCurrentHour(
                hourlyData: forecastData,
                cardWidth: MediaQuery.sizeOf(context).height / 9);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).height / 2,
                  height: MediaQuery.sizeOf(context).height / 6,
                  child: ListView.builder(
                    controller: weatherController.forecastScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: forecastData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        // height: MediaQuery.sizeOf(context).height / 9,
                        width: MediaQuery.sizeOf(context).height / 9,
                        child: GestureDetector(
                          onTap: () {
                            weatherController.changeIndex(index);
                            // log(weatherController.currentHourIndex.toString());
                          },
                          child: Consumer<WeatherController>(
                              builder: (context, provider, child) {
                            return Card(
                              color: index == weatherController.currentHourIndex
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
