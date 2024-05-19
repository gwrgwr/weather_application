import 'package:flutter/foundation.dart';
import 'package:weather_application/feature_current_weather/controllers/city_placemarks_states.dart';
import 'package:weather_application/feature_current_weather/data/user_city.dart';

class PlacemarkStore extends ValueNotifier<CityPlaceMarkState> {
  PlacemarkStore() : super(CityPlaceMarkInitialState());
  Future getUserCity() async {
    value = CityPlaceMarkLoadingState();
    try {
      final response = UserCity();
      final placemarkModel = await response.getUserCity();
      value = CityPlaceMarkSuccessState(placemarkModel: placemarkModel);
    } catch (e) {
      value = CityPlaceMarkErrorState(message: e.toString());
    }
  }
}
