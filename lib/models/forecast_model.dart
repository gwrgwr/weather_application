// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_application/models/weather_model.dart';

class ForecastModel {
  final List<Weather> list;
  final List<String> dateTime;

  ForecastModel({
    required this.list,
    required this.dateTime,
  });

  ForecastModel copyWith({
    List<Weather>? list,
    List<String>? dateTime,
  }) {
    return ForecastModel(
      list: list ?? this.list,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
      'dateTime': dateTime,
    };
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    String dt;
    List<String> list = [];
    for (var item in map['list']) {
      dt = item['dt_txt'];
      list.add(dt);
    }
    return ForecastModel(
      list: List<Weather>.from((map['list'] as List<dynamic>).map<Weather>((x) => Weather.fromMap(x as Map<String,dynamic>),),),
      dateTime: List<String>.from(list),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastModel.fromJson(String source) => ForecastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForecastModel(list: $list, dateTime: $dateTime)';

  @override
  bool operator ==(covariant ForecastModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.list, list) &&
      listEquals(other.dateTime, dateTime);
  }

  @override
  int get hashCode => list.hashCode ^ dateTime.hashCode;
}
