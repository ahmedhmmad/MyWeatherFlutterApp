import 'package:flutter/material.dart';
import 'package:myweatherapp/models/weather.dart';
import 'package:myweatherapp/services/weatherservice.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;

  WeatherModel? get weatherModel => _weatherModel;
  set weatherModel(WeatherModel? weather) {
    _weatherModel = weather;
    notifyListeners();
  }
}
