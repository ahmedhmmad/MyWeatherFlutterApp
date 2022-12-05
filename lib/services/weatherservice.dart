import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myweatherapp/models/weather.dart';
import 'package:myweatherapp/providers/weather_provider.dart';

class WeatherService {
  String apiKey = '616c2d4b8c48462f8ca195110210502';
  String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    var url = Uri.parse('$baseUrl?key=${apiKey}&q=${cityName}&aqi=no');

    // Await the http get response, then decode the json-formatted response.
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      WeatherModel wm = WeatherModel.fromJson(data);
      print(wm.toString());

      return wm;
    }
  }
}
