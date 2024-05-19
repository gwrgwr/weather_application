import 'package:flutter/material.dart';
import 'package:weather_application/feature_current_weather/controllers/weather_state.dart';
import 'package:weather_application/feature_current_weather/data/current_weather.dart';
import 'package:weather_application/feature_current_weather/data/data_to_file.dart';
import 'package:weather_application/feature_current_weather/models/other_info_model.dart';
import 'package:weather_application/feature_current_weather/models/temperature_model.dart';
import 'package:weather_application/feature_current_weather/models/weather_info.dart';
import 'package:weather_application/feature_current_weather/models/weather_model.dart';

class WeatherStore extends ValueNotifier<WeatherState> {
  WeatherStore() : super(WeatherInitialState());

  Future<List<WeatherInfo>> readData(String data) async {
    final newList = data
        .trim()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('), ', '), \$')
        .split(', \$');

    final weatherString =
        newList[0].replaceAll('Weather(', '').replaceAll(')', '').split(', ');
    final temperatureString = newList[1]
        .replaceAll('TemperatureModel(', '')
        .replaceAll(')', '')
        .split(', ');
    final otherInfoString =
        newList[2].replaceAll('OtherInfo(', '').replaceAll(')', '').split(', ');
    Map<String, dynamic> weatherMap = {};
    Map<String, dynamic> temperatureMap = {};
    Map<String, dynamic> otherInfoMap = {};
    for (var item in weatherString) {
      final teste = item.split(': ');
      weatherMap[teste[0]] = teste[1];
    }
    for (var item in temperatureString) {
      final teste = item.split(': ');
      temperatureMap[teste[0]] = teste[1];
    }
    for (var item in otherInfoString) {
      final teste = item.split(': ');
      otherInfoMap[teste[0]] = teste[1];
    }
    List<WeatherInfo> list = [
      Weather(
          id: int.parse(weatherMap['id']),
          main: weatherMap['main'],
          description: weatherMap['description'],
          icon: weatherMap['icon']),
      TemperatureModel(
          temp: int.parse(temperatureMap['temp']),
          tempMin: int.parse(temperatureMap['tempMin']),
          tempMax: int.parse(temperatureMap['tempMax']),
          humidity: int.parse(temperatureMap['humidity'])),
      OtherInfo(
        sunrise: int.parse(otherInfoMap['sunrise']),
        sunset: int.parse(otherInfoMap['sunset']),
        windSpeed: double.parse(otherInfoMap['windSpeed']),
        pressure: int.parse(otherInfoMap['pressure']),
      ),
    ];
    return list;
  }

  Future getWeatherData() async {
    value = WeatherLoadingState();
    try {
      final file = DataToFile();
        final currentWeather = CurrentWeather();
        final weatherList = await currentWeather.getWeather();
      if (await file.readData() == "[]") {
        await file.writeData(weatherList);
        final data = await file.readData() as String;
        value = WeatherSuccessState(weatherInfo: await readData(data));
      } else {
        await file.writeData(weatherList);
        value = WeatherSuccessState(weatherInfo: weatherList);
      }
    } catch (e) {
      value = WeatherErrorState(message: e.toString());
    }
  }
}
