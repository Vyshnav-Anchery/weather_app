import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controller/weather_controller.dart';

class ForecastListViewWidget extends StatefulWidget {
  const ForecastListViewWidget(
      {super.key,
      required this.forecastData,
      required this.index,
      required this.width});

  final forecastData;
  final int index;
  final double width;

  @override
  State<ForecastListViewWidget> createState() => _ForecastListViewWidgetState();
}

class _ForecastListViewWidgetState extends State<ForecastListViewWidget>
    with AutomaticKeepAliveClientMixin {
  late WeatherController weatherController;

  @override
  bool get wantKeepAlive => true; // Set this to true to keep state

  @override
  void initState() {
    // log("init");
    weatherController = Provider.of<WeatherController>(context, listen: false);
    weatherController.scrollToCurrentHour(
        hourlyData: widget.forecastData, cardWidth: widget.width);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      // height: MediaQuery.sizeOf(context).height / 9,
      width: MediaQuery.sizeOf(context).height / 9,
      child: GestureDetector(
        onTap: () {
          weatherController.changeIndex(widget.index);
          log(weatherController.currentHourIndex.toString());
        },
        child: Consumer<WeatherController>(
          builder: (context,provider,child) {
            return Card(
              color: widget.index == weatherController.currentHourIndex
                  ? const Color.fromARGB(230, 170, 225, 238)
                  : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text(forecastData[index].time!.substring(10)),
                  Text(DateFormat.jm().format(
                      DateTime.parse(widget.forecastData[widget.index].time!))),
                  Image.network(
                      "https:${widget.forecastData[widget.index].condition!.icon}"),
                  Text("${widget.forecastData[widget.index].tempC} °C")
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
