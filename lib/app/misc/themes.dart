// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Color.fromRGBO(23, 166, 45, 1);
const secondaryLightColor = Color.fromRGBO(88, 86, 87, 1);
const secondaryDarkColor = Color.fromRGBO(255, 255, 255, 1);

final appLightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  primaryColor: seedColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: secondaryLightColor),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: secondaryLightColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: seedColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      elevation: 0,
      fixedSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);

final appDarkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  primaryColor: seedColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: secondaryDarkColor),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: secondaryDarkColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: seedColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      elevation: 0,
      fixedSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);
