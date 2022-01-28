import 'package:flutter/material.dart';

// Темная тема
ThemeData globalThemeDark() => ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.yellow,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
  ).copyWith(
    secondary: Colors.green,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20.0, color: Colors.white, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Roboto', color: Colors.blue),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', fontWeight: FontWeight.bold,
        color: Colors.orange),
    button: TextStyle(fontSize: 16.0, fontFamily: 'Roboto', color: Colors.white),
  ),
);

// Светлая тема
ThemeData globalThemeLight() => ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.yellow,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primaryColorDark: Colors.orange,
    primarySwatch: Colors.orange,
  ).copyWith(
    secondary: Colors.green,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20.0, color: Colors.white, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Roboto', color: Colors.blue),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', fontWeight: FontWeight.bold,
        color: Colors.brown),
    button: TextStyle(fontSize: 16.0, fontFamily: 'Roboto', color: Colors.white),
  ),
);