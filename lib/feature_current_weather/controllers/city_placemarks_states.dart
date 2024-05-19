import 'package:weather_application/feature_current_weather/models/placemark_model.dart';

class CityPlaceMarkState {}

class CityPlaceMarkInitialState extends CityPlaceMarkState {}

class CityPlaceMarkLoadingState extends CityPlaceMarkState {}

class CityPlaceMarkSuccessState extends CityPlaceMarkState {
  final PlacemarkModel placemarkModel;
  CityPlaceMarkSuccessState({required this.placemarkModel});
}

class CityPlaceMarkErrorState extends CityPlaceMarkState {
  final String message;

  CityPlaceMarkErrorState({required this.message});
}
