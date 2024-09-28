import 'package:pdax_work_trial/features/person_list/data/models/models.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';

class PersonListModel extends PersonListEntity {
  const PersonListModel({
    super.status,
    super.code,
    super.locale,
    super.seed,
    super.total,
    super.data,
  });

  factory PersonListModel.fromMap(Map<String, dynamic> data) {
    return PersonListModel(
      status: data['status'] as String?,
      code: data['code'] as int?,
      locale: data['locale'] as String?,
      seed: data['seed'] as dynamic,
      total: data['total'] as int?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => PersonListDatum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
