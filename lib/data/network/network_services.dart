import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_assignment/configs/api_constants.dart';
import 'package:weather_app_assignment/data/exceptions/app_exceptions.dart';
import 'package:weather_app_assignment/model/weekly_weather.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "${ApiConstants.openWeatherMapURL}?lat=28.5175&lon=81.7787&appid=${ApiConstants.apiKey}"),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        debugPrint('Response_Json : $json');
        return WeeklyWeather.fromJson(returnResponse(json));
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
    dynamic returnResponse(http.Response response) {
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 400:
          throw BadRequestException(response.toString());
        case 401:
        case 403:
          throw UnauthorizedException(response.body.toString());
        case 404:
          throw UnauthorizedException(response.body.toString());
        case 500:
        default:
          throw FetchDataException(
              'Error occurred while communication with server with status code : ${response.statusCode}');
      }
    }

}
