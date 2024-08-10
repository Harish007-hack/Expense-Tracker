import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade600,
      inversePrimary: Colors.grey.shade400),
  textTheme: const TextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);
