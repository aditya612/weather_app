import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_data.dart';

class Weather extends StatelessWidget {
  final WeatherData weatherData;

  Weather({@required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(weatherData.name, style: new TextStyle(color: Colors.white)),
        Text(weatherData.main, style: new TextStyle(color: Colors.white, fontSize: 32.0)),
        Text('${weatherData.temp.toString()}°C', style: new TextStyle(color: Colors.white)),
        Image.network('https://openweathermap.org/img/w/${weatherData.icon}.png'),
        Text(new DateFormat.yMMMd().format(weatherData.date), style: new TextStyle(color: Colors.white)),
        Text(new DateFormat.Hm().format(weatherData.date), style: new TextStyle(color: Colors.white)),
      ],
    );
  }
}
