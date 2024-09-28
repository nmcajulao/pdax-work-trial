import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';

class PersonListDatumEntity extends Equatable {
  const PersonListDatumEntity({
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

  factory PersonListDatumEntity.fromMap(Map<String, dynamic> data) =>
      PersonListDatumEntity(
        id: data['id'] as int?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        birthday: data['birthday'] as String?,
        gender: data['gender'] as String?,
        address: data['address'] == null
            ? null
            : PersonListAddressEntity.fromMap(
                data['address'] as Map<String, dynamic>,
              ),
        website: data['website'] as String?,
        image: data['image'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns
  /// the resulting Json object as [PersonListDatumEntity].
  factory PersonListDatumEntity.fromJson(String data) {
    return PersonListDatumEntity.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  String get name => '${firstname ?? ''} ${lastname ?? ''}';

  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? birthday;
  final String? gender;
  final PersonListAddressEntity? address;
  final String? website;
  final String? image;

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
  /// Converts [PersonListDatumEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  PersonListDatumEntity copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? birthday,
    String? gender,
    PersonListAddressEntity? address,
    String? website,
    String? image,
  }) {
    return PersonListDatumEntity(
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
