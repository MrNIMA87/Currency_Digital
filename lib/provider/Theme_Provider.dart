import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
      labelSmall: GoogleFonts.ubuntu(
          color: Colors.white54, fontSize: 13.5, fontWeight: FontWeight.w500),
      titleSmall: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    ),
    unselectedWidgetColor: Colors.white70,
    primaryColorLight: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.blueAccent[700],
    secondaryHeaderColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black, opacity: 1.0),
    buttonColor: Colors.red,
  );
  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(
          color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w800),
      labelSmall: GoogleFonts.ubuntu(
          color: Colors.black38, fontSize: 13.5, fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black87, fontSize: 15),
    ),
    unselectedWidgetColor: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent,
    secondaryHeaderColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white, opacity: 1.0),
  );
}
