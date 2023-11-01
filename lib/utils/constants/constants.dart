import 'package:flutter/material.dart';

class Constants {
  static List<String> icons = [];
  static ThemeData appThemeData = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 51, 28, 113),
    cardTheme: const CardTheme(color: Color.fromARGB(255, 88, 66, 169)),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    useMaterial3: true,
  );
}
