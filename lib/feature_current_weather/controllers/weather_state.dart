import 'package:weather_application/feature_current_weather/models/weather_info.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final List<WeatherInfo> weatherInfo;

  WeatherSuccessState({
    required this.weatherInfo,
  });
}

class WeatherErrorState extends WeatherState {
  final String message;

  WeatherErrorState({
    required this.message,
  });
}
