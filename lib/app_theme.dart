import 'package:flutter/material.dart';

class AppTheme {
  static Color blackColor = const Color(0xFF303030);
  static Color whiteColor = Colors.white;
  static Color redColor = const Color(0xFFC91C22);
  static Color roseColor = const Color(0xFFED1E79);
  static Color lightBlueColor = const Color(0xFF4882CF);
  static Color darkBlueColor = const Color(0xFF003E90);
  static Color brownColor = const Color(0xFFCF7E48);
  static Color yellowColor = const Color(0xFFF2D352);
  static ThemeData appTheme = ThemeData(
      primaryColor: const Color(0xFF39A552),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF39A552)),
      appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF39A552),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontFamily: 'Exo', fontSize: 22, fontWeight: FontWeight.w400),
          foregroundColor: whiteColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)))),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontFamily: 'Roppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: blackColor),
        titleMedium: const TextStyle(
            fontFamily: 'Roppins',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F5A69)),
        titleSmall: TextStyle(
            fontFamily: 'Roppins',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: blackColor),
        bodyMedium: TextStyle(
            fontFamily: 'Exo',
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: whiteColor),
      ));
}
