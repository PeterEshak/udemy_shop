import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  platform: TargetPlatform.android,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: defaultColor,
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: HexColor('333739'),
    // selectedIconTheme:
    //     const IconThemeData(color: defaultColor, size: 20),
    // unselectedIconTheme: const IconThemeData(
    //   color: Colors.grey,
    //   size: 15,
    //   opacity: .5,
    // ),
    // selectedLabelStyle: const TextStyle(
    //   color: Colors.lightGreenAccent,
    //   fontSize: 20,
    //   wordSpacing: 2,
    //   letterSpacing: 2,
    //   fontWeight: FontWeight.w900,
    // ),
    // unselectedLabelStyle: const TextStyle(
    //   color: Colors.green,
    //   fontSize: 15,
    //   wordSpacing: 1,
    //   letterSpacing: 1,
    //   fontWeight: FontWeight.w500,
    // ),
    // showSelectedLabels: true,
    // showUnselectedLabels: true,
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  platform: TargetPlatform.android,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: defaultColor,
  // ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: Colors.white,
    // selectedIconTheme: IconThemeData(color: defaultColor, size: 20),
    // unselectedIconTheme: IconThemeData(
    //   color: Colors.grey,
    //   size: 15,
    //   opacity: .5,
    // ),
    // selectedLabelStyle: TextStyle(
    //   color: Colors.lightBlueAccent,
    //   fontSize: 20,
    //   wordSpacing: 2,
    //   letterSpacing: 2,
    //   fontWeight: FontWeight.w900,
    // ),
    // unselectedLabelStyle: TextStyle(
    //   color: Colors.blueGrey,
    //   fontSize: 15,
    //   wordSpacing: 1,
    //   letterSpacing: 1,
    //   fontWeight: FontWeight.w500,
    // ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',
);
