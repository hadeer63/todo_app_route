import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared/styles/colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: mint,
      // textTheme: TextTheme(
      //   bodySmall: GoogleFonts.elMessiri(
      //       color: Colors.black45, fontSize: 20, fontWeight: FontWeight.w400),
      //   bodyMedium: GoogleFonts.elMessiri(
      //       color: Color(0xFFFFFFFF),
      //       fontSize: 12,
      //       fontWeight: FontWeight.w700),
      //   bodyLarge: GoogleFonts.elMessiri(
      //       color: Colors.black45, fontSize: 30, fontWeight: FontWeight.bold),
      // ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false));
  static ThemeData darkTheme =ThemeData();
}
