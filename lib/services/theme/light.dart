import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade400,
        tertiary: Colors.grey.shade500,
        inversePrimary: Colors.grey.shade800),
    textTheme: const TextTheme().apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ));
