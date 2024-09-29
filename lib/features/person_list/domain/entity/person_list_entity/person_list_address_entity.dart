import 'dart:convert';

import 'package:equatable/equatable.dart';

class PersonListAddressEntity extends Equatable {
  const PersonListAddressEntity({
    this.id,
    this.street,
    this.streetName,
    this.buildingNumber,
    this.city,
    this.zipcode,
    this.country,
    this.countryCode,
    this.latitude,
    this.longitude,
  });

  factory PersonListAddressEntity.fromMap(Map<String, dynamic> data) =>
      PersonListAddressEntity(
        id: data['id'] as int?,
        street: data['street'] as String?,
        streetName: data['streetName'] as String?,
        buildingNumber: data['buildingNumber'] as String?,
        city: data['city'] as String?,
        zipcode: data['zipcode'] as String?,
        country: data['country'] as String?,
        countryCode: data['country_code'] as String?,
        latitude: (data['latitude'] as num?)?.toDouble(),
        longitude: (data['longitude'] as num?)?.toDouble(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns
  /// the resulting Json object as [PersonListAddressEntity].
  factory PersonListAddressEntity.fromJson(String data) {
    return PersonListAddressEntity.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  String get address => '$street, $streetName, $buildingNumber, $city, '
      '$zipcode, $country $countryCode';

  final int? id;
  final String? street;
  final String? streetName;
  final String? buildingNumber;
  final String? city;
  final String? zipcode;
  final String? country;
  final String? countryCode;
  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toMap() => {
        'id': id,
        'street': street,
        'streetName': streetName,
        'buildingNumber': buildingNumber,
        'city': city,
        'zipcode': zipcode,
        'country': country,
        'country_code': countryCode,
        'latitude': latitude,
        'longitude': longitude,
      };

  /// `dart:convert`
  ///
  /// Converts [PersonListAddressEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  PersonListAddressEntity copyWith({
    int? id,
    String? street,
    String? streetName,
    String? buildingNumber,
    String? city,
    String? zipcode,
    String? country,
    String? countryCode,
    double? latitude,
    double? longitude,
  }) {
    return PersonListAddressEntity(
      id: id ?? this.id,
      street: street ?? this.street,
      streetName: streetName ?? this.streetName,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      street,
      streetName,
      buildingNumber,
      city,
      zipcode,
      country,
      countryCode,
      latitude,
      longitude,
    ];
  }
}
