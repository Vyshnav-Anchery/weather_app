import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel data;
  const WeatherCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(DateFormat.EEEE().format(DateTime.now()),
                    style: const TextStyle(fontSize: 40)),
                Text(
                    "${DateTime.now().day}-${DateFormat.MMMM().format(DateTime.now())}",
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      "https:${data.current!.condition!.icon}",
                      color: Colors.white,
                    ),
                    Text(
                      data.current!.condition!.text!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data.current!.tempC} °C",
                      style: GoogleFonts.barlowCondensed(fontSize: 40),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
