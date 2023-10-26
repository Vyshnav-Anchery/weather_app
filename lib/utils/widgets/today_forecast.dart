import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';

class TodayForecast extends StatelessWidget {
  const TodayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =Provider.of<WeatherController>(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).height / 2,
      height: MediaQuery.sizeOf(context).height / 9,
      child: FutureBuilder(
        future: weatherController.getWeather(),
        builder: (context,snapshot) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 14,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height / 9,
                width: MediaQuery.sizeOf(context).height / 9,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("10 AM"),
                      Text("10 AM"),
                      // Image.network("src"),
                      Text("23 C")
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
