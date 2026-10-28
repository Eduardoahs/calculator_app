import 'package:flutter/material.dart';
import 'package:calculator_app/routes/app_routes.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(),
    );
  }
}