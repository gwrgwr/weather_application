import 'package:weather_application/models/forecast_model.dart';

abstract class ForecastState {}

class ForecastInitialState extends ForecastState {}

class ForecastLoadingState extends ForecastState {}

class ForecastSuccessState extends ForecastState {
  final ForecastModel forecastModel;

  ForecastSuccessState({required this.forecastModel});
}

class ForecastErrorState extends ForecastState {
  final String message;

  ForecastErrorState({required this.message});
}
