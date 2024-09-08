import 'package:flutter/material.dart';
import 'package:weather_app_assignment/data/network/network_services.dart';
import 'package:weather_app_assignment/model/weekly_weather.dart';

class WeatherProvider extends ChangeNotifier {

  final WeatherServices _weatherServices = WeatherServices();

  WeeklyWeather? weatherData;
  String? errorMessage;
  bool isLoading = true;

  WeatherProvider() {
    fetchWeeklyForecast();
  }

  Future<void> fetchWeeklyForecast() async {
    try {
      isLoading = true;
      weatherData = await _weatherServices.fetchWeather();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
