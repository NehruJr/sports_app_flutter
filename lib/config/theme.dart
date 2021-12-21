import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultPrimaryColor = Color(0xFF48D876);
const appSecondaryColor = Color(0xFF232441);

class SportsTheme {
  ThemeData appTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: defaultPrimaryColor,
        onPrimary: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme:IconThemeData(
          color: Colors.black
        ),
        color: Colors.white
      ),
      textTheme: lightTextTheme,
    );
  }

  TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.lato(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.bebasNeue(
      fontSize: 28,
      color: Colors.black,
      letterSpacing: 1.8,
    ),
    headline3: GoogleFonts.lato(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline4: GoogleFonts.lato(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline5: GoogleFonts.lato(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline6: GoogleFonts.lato(
      fontSize: 14,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );
}
