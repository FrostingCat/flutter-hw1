import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 160, 58, 178), opacity: 0.8),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Color.fromARGB(255, 160, 58, 178),
              fontSize: 25,
              fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
              color: Color.fromARGB(255, 198, 195, 195),
              fontSize: 20,
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              color: Color.fromARGB(228, 183, 183, 183), fontSize: 14)));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 40, 71, 211), opacity: 0.8),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Color.fromARGB(255, 40, 71, 211),
              fontSize: 25,
              fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
          bodySmall:
              TextStyle(color: Color.fromARGB(255, 42, 42, 42), fontSize: 14)));
}
