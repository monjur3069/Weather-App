import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //late WeatherProvider provider;

    return Scaffold(
        body: Consumer<WeatherProvider>(
      builder: (context, provider, child) => ListView(
        children: [
          SwitchListTile(
              title: Text('Show tempareture in farenheit'),
              subtitle: Text('Default is celcius'),
              value: provider.isFahrenheit,
              onChanged: (value) async {
                provider.setTempUnit(value);
                await provider.setTempUnitPreferenceValue(value);
                provider.getWeatherData();
              })
        ],
      ),
    ));
  }
}
