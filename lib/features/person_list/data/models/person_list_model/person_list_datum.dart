import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'person_list_address.dart';

class PersonListDatum extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? birthday;
  final String? gender;
  final PersonListAddress? address;
  final String? website;
  final String? image;

  const PersonListDatum({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.website,
    this.image,
  });

  factory PersonListDatum.fromMap(Map<String, dynamic> data) => PersonListDatum(
        id: data['id'] as int?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        birthday: data['birthday'] as String?,
        gender: data['gender'] as String?,
        address: data['address'] == null
            ? null
            : PersonListAddress.fromMap(
                data['address'] as Map<String, dynamic>),
        website: data['website'] as String?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
        'birthday': birthday,
        'gender': gender,
        'address': address?.toMap(),
        'website': website,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PersonListDatum].
  factory PersonListDatum.fromJson(String data) {
    return PersonListDatum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PersonListDatum] to a JSON string.
  String toJson() => json.encode(toMap());

  PersonListDatum copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? birthday,
    String? gender,
    PersonListAddress? address,
    String? website,
    String? image,
  }) {
    return PersonListDatum(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      website: website ?? this.website,
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      firstname,
      lastname,
      email,
      phone,
      birthday,
      gender,
      address,
      website,
      image,
    ];
  }
}
