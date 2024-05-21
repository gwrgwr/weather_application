// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_application/models/weather_model.dart';

class ForecastModel {
  final List<Weather> list;

  ForecastModel({
    required this.list,
  });

  ForecastModel copyWith({
    List<Weather>? list,
  }) {
    return ForecastModel(
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      list: List<Weather>.from((map['list'] as List<dynamic>).map<Weather>((x) => Weather.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastModel.fromJson(String source) => ForecastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForecastModel(list: $list)';

  @override
  bool operator ==(covariant ForecastModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.list, list);
  }

  @override
  int get hashCode => list.hashCode;
}
