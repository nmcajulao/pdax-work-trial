import 'package:pdax_work_trial/features/person_list/data/models/models.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';

class PersonListDatum extends PersonListDatumEntity {
  const PersonListDatum({
    super.id,
    super.firstname,
    super.lastname,
    super.email,
    super.phone,
    super.birthday,
    super.gender,
    super.address,
    super.website,
    super.image,
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
                data['address'] as Map<String, dynamic>,
              ),
        website: data['website'] as String?,
        image: data['image'] as String?,
      );
}
