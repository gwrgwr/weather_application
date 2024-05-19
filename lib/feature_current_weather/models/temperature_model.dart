// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_application/feature_current_weather/models/weather_info.dart';

class TemperatureModel extends WeatherInfo {
  final int temp;
  final int tempMin;
  final int tempMax;
  final int humidity;

  TemperatureModel({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  TemperatureModel copyWith({
    int? temp,
    int? tempMin,
    int? tempMax,
    int? humidity,
  }) {
    return TemperatureModel(
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'humidity': humidity,
    };
  }

  factory TemperatureModel.fromMap(Map<String, dynamic> map) {
    return TemperatureModel(
      temp: map['main']['temp'].round() as int,
      tempMin: map['main']['temp_min'].round() as int,
      tempMax: map['main']['temp_max'].round() as int,
      humidity: map['main']['humidity'].round() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TemperatureModel.fromJson(String source) => TemperatureModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TemperatureModel(temp: $temp, tempMin: $tempMin, tempMax: $tempMax, humidity: $humidity)';
  }

  @override
  bool operator ==(covariant TemperatureModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.temp == temp &&
      other.tempMin == tempMin &&
      other.tempMax == tempMax &&
      other.humidity == humidity;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
      tempMin.hashCode ^
      tempMax.hashCode ^
      humidity.hashCode;
  }
}
