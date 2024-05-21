import 'package:weather_application/models/temperature_model.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherInfo {
  final Weather? weather;
  final TemperatureModel? temperature;

  WeatherInfo([this.weather, this.temperature]);
}
