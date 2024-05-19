import 'package:weather_application/feature_current_weather/models/temperature_model.dart';
import 'package:weather_application/feature_current_weather/models/weather_model.dart';

class WeatherInfo {
  final Weather? weather;
  final TemperatureModel? temperature;

  WeatherInfo([this.weather, this.temperature]);
}
