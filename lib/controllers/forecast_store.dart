import 'package:flutter/material.dart';
import 'package:weather_application/controllers/forecast_states.dart';
import 'package:weather_application/data/forecast_weather.dart';

class ForecastStore extends ValueNotifier<ForecastState> {
  ForecastStore() : super(ForecastInitialState());

  Future getForecastWeather() async {
    value = ForecastLoadingState();
    try {
      final forecastWeather = ForecastWeather();
      final forecast = await forecastWeather.getForecastWeather();
      value = ForecastSuccessState(forecastModel: forecast);
    } catch (e) {
      value = ForecastErrorState(message: e.toString());
    }
  }
}