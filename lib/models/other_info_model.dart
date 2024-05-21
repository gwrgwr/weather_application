// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_application/models/weather_info.dart';

class OtherInfo extends WeatherInfo {
  final int sunrise;
  final int sunset;
  final double windSpeed;
  final int pressure;

  OtherInfo({
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
    required this.pressure,
  });

  OtherInfo copyWith({
    int? sunrise,
    int? sunset,
    double? windSpeed,
    int? pressure,
  }) {
    return OtherInfo(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      windSpeed: windSpeed ?? this.windSpeed,
      pressure: pressure ?? this.pressure,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sunrise': sunrise,
      'sunset': sunset,
      'windSpeed': windSpeed,
      'pressure': pressure,
    };
  }

  factory OtherInfo.fromMap(Map<String, dynamic> map) {
    return OtherInfo(
      sunrise: map['sys']['sunrise'] as int,
      sunset: map['sys']['sunset'] as int,
      windSpeed: map['wind']['speed'] as double,
      pressure: map['main']['pressure'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherInfo.fromJson(String source) => OtherInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OtherInfo(sunrise: $sunrise, sunset: $sunset, windSpeed: $windSpeed, pressure: $pressure)';
  }

  @override
  bool operator ==(covariant OtherInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.sunrise == sunrise &&
      other.sunset == sunset &&
      other.windSpeed == windSpeed &&
      other.pressure == pressure;
  }

  @override
  int get hashCode {
    return sunrise.hashCode ^
      sunset.hashCode ^
      windSpeed.hashCode ^
      pressure.hashCode;
  }
}
