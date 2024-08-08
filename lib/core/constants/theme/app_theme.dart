import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/fonts/font_style.dart';

ThemeData get light => ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: ColorConst.darkGrey,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      scaffoldBackgroundColor: ColorConst.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.white,
        elevation: 0,
        selectedItemColor: ColorConst.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: ColorConst.white,
      ),
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.small,
        headlineMedium: FontStyleConst.medium,
        headlineLarge: FontStyleConst.huge,
        bodyLarge: FontStyleConst.big,
      ),
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: ColorConst.black,
      ),
    );

ThemeData get dark => ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.darkGrey,
        elevation: 0,
        selectedItemColor: ColorConst.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      appBarTheme: AppBarTheme(elevation: 0, backgroundColor: ColorConst.black),
      scaffoldBackgroundColor: ColorConst.black,
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.small.copyWith(color: ColorConst.white),
        headlineMedium: FontStyleConst.medium.copyWith(color: ColorConst.white),
        headlineLarge: FontStyleConst.huge.copyWith(color: ColorConst.white),
        bodyLarge: FontStyleConst.big.copyWith(color: ColorConst.white),
      ),
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: ColorConst.white,
      ),
    );
