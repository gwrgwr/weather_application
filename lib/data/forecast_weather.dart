import 'package:weather_application/data/user_coordinantes.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/models/forecast_model.dart';

class ForecastWeather {
  Future<ForecastModel> getForecastWeather() async {
    const apiKey = String.fromEnvironment("API_KEY");
    final userCoordinates = UserCoordinates();
    final coordinates = await userCoordinates.getUserCoordinates();
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$apiKey',
      ),
    );
    print(ForecastModel.fromJson(response.body));
    return ForecastModel.fromJson(response.body);
  }
}
