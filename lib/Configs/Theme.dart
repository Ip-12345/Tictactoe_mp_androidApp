import 'package:flutter/material.dart';
import 'package:basico/Configs/Colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
    fillColor: containerColor,
    filled: true,
    hintStyle: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: labelColor),
  ),
  colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: bgColor,
      onSurface: fontColor,
      primaryContainer: containerColor,
      onPrimaryContainer: labelColor),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 18, fontFamily: "Poppins", fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(
        fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.w400),
    labelMedium: TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: labelColor),
  ),
);
