import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';

class PersonListAddress extends PersonListAddressEntity {
  const PersonListAddress({
    super.id,
    super.street,
    super.streetName,
    super.buildingNumber,
    super.city,
    super.zipcode,
    super.country,
    super.countryCode,
    super.latitude,
    super.longitude,
  });

  factory PersonListAddress.fromMap(Map<String, dynamic> data) =>
      PersonListAddress(
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
}
