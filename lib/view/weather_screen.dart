import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/dropdown_button_controller.dart';
import 'package:weather_app/controller/forecast_weather_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/widgets/search_delegate.dart';
import 'package:weather_app/utils/widgets/today_forecast.dart';
import 'package:weather_app/utils/constants/constants.dart';
import '../utils/widgets/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForecastController forecastController =
        Provider.of<ForecastController>(context, listen: false);
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
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          " , ${snapshot.data!.location!.region}",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
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
                                  onPressed: () => weatherController.refresh(),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder(
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
                                return Consumer<DropDownButtonController>(
                                    builder: (context, dropdownDuttonController,
                                        child) {
                                  return DropdownButton(
                                    iconEnabledColor: Colors.white,
                                    underline: Container(),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Constants.cardBg,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17),
                                    value: dropdownDuttonController.initial,
                                    items: forecastSnapshot
                                        .data!.forecast.forecastday
                                        .map((e) => DropdownMenuItem(
                                            alignment: Alignment.center,
                                            value: dropdownDuttonController
                                                .setDropdownValue(
                                                    currentTime: DateTime.parse(
                                                        forecastSnapshot
                                                            .data!
                                                            .location
                                                            .localtime),
                                                    date:
                                                        DateTime.parse(e.date)),
                                            child: Text(e.date)))
                                        .toList(),
                                    onChanged: (value) {
                                      dropdownDuttonController
                                          .toggleMenuButton(value);
                                    },
                                  );
                                });
                              }
                            },
                          ),
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
