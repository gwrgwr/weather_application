import 'package:http/http.dart' as http;
import 'package:weather_application/feature_current_weather/data/user_coordinantes.dart';
import 'package:weather_application/feature_current_weather/models/other_info_model.dart';
import 'package:weather_application/feature_current_weather/models/temperature_model.dart';
import 'package:weather_application/feature_current_weather/models/weather_info.dart';
import 'package:weather_application/feature_current_weather/models/weather_model.dart';

class CurrentWeather {
  Future<List<WeatherInfo>> getWeather() async {
    final coordinates = await UserCoordinates().getUserCoordinates();
    const apiKey = String.fromEnvironment("API_KEY");
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$apiKey',
      ),
    );
    List<WeatherInfo> weatherList = [];
    weatherList.addAll([
      Weather.fromJson(response.body),
      TemperatureModel.fromJson(response.body),
      OtherInfo.fromJson(response.body)
    ]);
    return weatherList;
  }
}
