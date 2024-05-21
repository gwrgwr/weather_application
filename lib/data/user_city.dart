import 'package:geocoding/geocoding.dart';
import 'package:weather_application/data/user_coordinantes.dart';
import 'package:weather_application/models/placemark_model.dart';

class UserCity {
  Future<PlacemarkModel> getUserCity() async {
    final userCoordinates = await UserCoordinates().getUserCoordinates();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        userCoordinates.latitude, userCoordinates.longitude);
    Placemark placemark = placemarks[0];
    final placemarkMap = {
      'country': placemark.country,
      'street': placemark.street,
      'city': placemark.administrativeArea
    };
    return PlacemarkModel.fromMap(placemarkMap);
  }
}
