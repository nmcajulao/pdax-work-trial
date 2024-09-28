import 'package:pdax_work_trial/core/resources/resources.dart';
import 'package:pdax_work_trial/features/person_list/data/models/models.dart';

abstract class PersonListRepository {
  Future<DataState<PersonListModel>> getPersonList();
}
