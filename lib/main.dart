import 'package:calc_pizza/screens/theme_demo_screen.dart';

import 'screens/app_bar_screen.dart';
import 'screens/navigation_drawer_screen.dart';
import 'screens/pizza_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/reg_screen.dart';

void main() {
  // Форма "Авторизации"
 // runApp(AuthScreen());

  // Форма "Регистрации"
  //runApp(RegScreen());

  // Форма "Калькулятор пиццы"
  //runApp(const PizzaCalculatorScreen());

  // Форма AppBar, Кнопки
  //runApp(const AppBarScreen());

  // Форма "DrawerHeader"
  //runApp(const NavigationDrawerScreen());

  // Форма "Калькулятор пиццы с поддержкой Темы"
  runApp(const ThemesDemoApp());
}


