import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class AppState with ChangeNotifier {
  bool isLoading = false;
  WeatherData weatherData;
  Location _location = new Location();
  String error;
  String apiKey = "41e6899871e954619837ef6c31dc8ba1";

  getIsLoaded() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future fetchWeather() async {
    LocationData currentLocation;

    try {
      currentLocation = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }
      currentLocation = null;
    }

    if (currentLocation != null) {
      final lat = currentLocation.latitude;
      final lon = currentLocation.longitude;

      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=$apiKey&lat=${lat.toString()}&lon=${lon.toString()}&units=metric');

      if (weatherResponse.statusCode == 200) {
        weatherData = WeatherData.fromJson(jsonDecode(weatherResponse.body));
        notifyListeners();
      }
    }
  }

  loadWeather() {
    getIsLoaded();
    fetchWeather();
    getIsLoaded();
  }
}
