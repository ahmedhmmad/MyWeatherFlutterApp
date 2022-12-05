import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final DateTime date;
  final String temp;
  final String maxTemp;
  final String minTemp;
  final String weatherStatusName;
  final String weatherIconImage;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatusName,
      required this.weatherIconImage});

  factory WeatherModel.fromJson(dynamic data) {
    // var jsonResponse = jsonDecode(data);
    var jsonData = data['forecast']['forecastday'][0];
    var gweatherStatusName = jsonData['day']['condition']['text'] ?? '0';

    return WeatherModel(
        city: data['location']['name'],
        date: DateTime.parse(jsonData['date']),
        temp: data['current']['temp_c'].toString(),
        maxTemp: jsonData['day']['maxtemp_c'].toString(),
        minTemp: jsonData['day']['mintemp_c'].toString(),
        weatherStatusName: jsonData['day']['condition']['text'] ?? '0',
        weatherIconImage: jsonData['day']['condition']['icon'] ?? '');
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'City is $city and Date is $date and Temp is $temp while MaxTemp is $maxTemp, and MinTemp is $minTemp';
  }
}
