import 'package:flutter/material.dart';

class Themes {

  static ThemeData get lightMode => ThemeData(
    primaryColor: const Color(0xffef5843),
    cardColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      displayMedium: TextStyle(
        color: Colors.grey[700]!,
        fontSize: 16,
        fontWeight: FontWeight.w400
      ),
      displaySmall: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400
      ),
    )
  );
}
