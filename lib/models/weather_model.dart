// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:weather_application/models/weather_info.dart';

class Weather extends WeatherInfo {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['weather'][0]['id'] as int,
      main: map['weather'][0]['main'] as String,
      description: map['weather'][0]['description'] as String,
      icon: map['weather'][0]['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.main == main &&
      other.description == description &&
      other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      main.hashCode ^
      description.hashCode ^
      icon.hashCode;
  }
}
