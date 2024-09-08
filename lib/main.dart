import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_assignment/view/screens/weather_home.dart';
import 'package:weather_app_assignment/view_model/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherProvider>(
      create: (context) => WeatherProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ForecastReportScreen(),
      ),
    );
  }
}

