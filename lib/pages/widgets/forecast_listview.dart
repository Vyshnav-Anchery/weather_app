import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/forecast_weather_controller.dart';
import 'package:weather_app/model/forecast_weather_model.dart';

class ForecastListViewWidget extends StatefulWidget {
  const ForecastListViewWidget(
      {super.key,
      required this.forecastData,
      required this.index,
      required this.width});

  final List<Hour> forecastData;
  final int index;
  final double width;

  @override
  State<ForecastListViewWidget> createState() => _ForecastListViewWidgetState();
}

class _ForecastListViewWidgetState extends State<ForecastListViewWidget> {
  late ForecastController forecastController;

  // @override
  // bool get wantKeepAlive => true; // Set this to true to keep state

  @override
  void initState() {
    // log("init");
    forecastController =
        Provider.of<ForecastController>(context, listen: false);
    forecastController.scrollToCurrentHour(
        hourlyData: widget.forecastData, cardWidth: widget.width);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return SizedBox(
      // height: MediaQuery.sizeOf(context).height / 9,
      width: MediaQuery.sizeOf(context).height / 9,
      child: Consumer<ForecastController>(builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.changeIndex(widget.index);
            log(forecastController.currentHourIndex.toString());
            log("jgjhkhv");
            log(widget.index.toString());
          },
          child: Card(
            color: widget.index == provider.currentHourIndex
                ? const Color.fromARGB(230, 170, 225, 238)
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text(forecastData[index].time!.substring(10)),
                Text(DateFormat.jm().format(
                    DateTime.parse(widget.forecastData[widget.index].time))),
                Image.network(
                    "https:${widget.forecastData[widget.index].condition.icon}"),
                Text("${widget.forecastData[widget.index].tempC} °C")
              ],
            ),
          ),
        );
      }),
    );
  }
}
