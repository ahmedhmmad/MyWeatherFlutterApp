import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myweatherapp/models/weather.dart';
import 'package:myweatherapp/pages/search_page.dart';
import 'package:myweatherapp/providers/weather_provider.dart';
import 'package:myweatherapp/services/weatherservice.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    MaterialColor getThemeColor() {
      if (Provider.of<WeatherProvider>(context)
              .weatherModel
              ?.weatherStatusName ==
          'Patchy rain possible') {
        return Colors.red;
      }
      return Colors.orange;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Provider.of<WeatherProvider>(context, listen: false).weatherModel =
                null;
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
            /** Do something */
          },
        ),
      ),
      body: Provider.of<WeatherProvider>(context).weatherModel == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'searching now ',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SearchPage())),
                        child: const Text(
                          '🔍',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [getThemeColor(), getThemeColor()[50]!],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              width: double.infinity,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    Provider.of<WeatherProvider>(context).weatherModel!.city,
                    style: TextStyle(
                        color: Color.fromARGB(255, 6, 6, 6),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),

                  // ignore: prefer_const_constructors
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Updated ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 6, 6),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        '${Provider.of<WeatherProvider>(context, listen: false).weatherModel!.date.day}/${Provider.of<WeatherProvider>(context, listen: false).weatherModel!.date.month}/${Provider.of<WeatherProvider>(context, listen: false).weatherModel!.date.year}',
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 6, 6),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        'http:${Provider.of<WeatherProvider>(context).weatherModel!.weatherIconImage}',
                      ),
                      Text(
                        Provider.of<WeatherProvider>(context)
                            .weatherModel!
                            .temp,
                        style: TextStyle(fontSize: 20),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'min: ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                Provider.of<WeatherProvider>(context)
                                    .weatherModel!
                                    .minTemp,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'max: ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                Provider.of<WeatherProvider>(context)
                                    .weatherModel!
                                    .maxTemp,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    Provider.of<WeatherProvider>(context)
                        .weatherModel!
                        .weatherStatusName,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
