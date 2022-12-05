import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweatherapp/services/weatherservice.dart';
import 'package:provider/provider.dart';

import '../models/weather.dart';
import '../providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController city = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: city,
              onSubmitted: (value) async {
                value = city.text.toString();
                print(value);
                WeatherService ws = WeatherService();

                WeatherModel? wm = await ws.getWeather(cityName: value);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherModel = wm;

                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  label: Text('Enter City'),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder()),
            ),
          )
        ],
      )),
    );
  }
}
