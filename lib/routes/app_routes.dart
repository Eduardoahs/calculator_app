import 'package:flutter/material.dart';
import 'package:calculator_app/screens/home_screen.dart';
import 'package:calculator_app/screens/info_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String info = '/info';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      info: (context) => const InfoScreen(),
    };
  }
}