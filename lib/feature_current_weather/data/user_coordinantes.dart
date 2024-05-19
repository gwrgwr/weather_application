import 'package:geolocator/geolocator.dart';
import 'package:weather_application/feature_current_weather/data/user_position.dart';
import 'package:weather_application/feature_current_weather/models/coordinates_model.dart';

class UserCoordinates {
  Future<CoordinatesModel> getUserCoordinates() async {
    final userPosition = UserPosition();
    Position position = await userPosition.getUserPosition();
    return CoordinatesModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
