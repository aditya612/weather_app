import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather.dart';
import 'package:weather_app/states/app_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: appState.weatherData != null ? Weather(weatherData: appState.weatherData) : SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: appState.isLoading ? CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: new AlwaysStoppedAnimation(Colors.white),
                      ) : IconButton(
                        icon: new Icon(Icons.refresh),
                        tooltip: 'Refresh',
                        onPressed: appState.loadWeather,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          )
        )
    );
  }
}