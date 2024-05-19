// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlacemarkModel {
  final String country;
  final String street;
  final String city;

  PlacemarkModel({
    required this.country,
    required this.street,
    required this.city,
  });

  

  PlacemarkModel copyWith({
    String? country,
    String? street,
    String? city,
  }) {
    return PlacemarkModel(
      country: country ?? this.country,
      street: street ?? this.street,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'street': street,
      'city': city,
    };
  }

  factory PlacemarkModel.fromMap(Map<String, dynamic> map) {
    return PlacemarkModel(
      country: map['country'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlacemarkModel.fromJson(String source) => PlacemarkModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PlacemarkModel(country: $country, street: $street, city: $city)';

  @override
  bool operator ==(covariant PlacemarkModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.country == country &&
      other.street == street &&
      other.city == city;
  }

  @override
  int get hashCode => country.hashCode ^ street.hashCode ^ city.hashCode;
}
