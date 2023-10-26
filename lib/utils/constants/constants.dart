import 'package:flutter/material.dart';

class Constants {
  static List<String> icons = [];
  static ThemeData appThemeData = ThemeData(
    cardTheme: const CardTheme(color: Color(0xff5842A9)),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    useMaterial3: true,
  );
}
