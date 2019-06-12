import 'package:flutter/material.dart';
import 'package:weather_app/Screens/home_page.dart';
import 'package:weather_app/states/app_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AppState(),
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
