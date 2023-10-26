import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/pages/widgets/weather_details.dart';

import 'forecast_listview.dart';

class TodayForecast extends StatelessWidget {
  const TodayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).height / 2,
      height: MediaQuery.sizeOf(context).height / 6,
      child: FutureBuilder(
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
              var forecastData = snapshot.data!.forecast!.forecastday![0].hour!;
              return ListView.builder(
                controller: weatherController.forecastScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: forecastData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ForecastListViewWidget(
                      forecastData: forecastData,
                      index: index,
                      width: MediaQuery.sizeOf(context).height / 9);
                },
              );
            }
          }),
    );
  }
}
