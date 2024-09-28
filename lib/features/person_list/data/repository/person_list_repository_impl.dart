import 'package:pdax_work_trial/common/exceptions/exceptions.dart';
import 'package:pdax_work_trial/common/models/models.dart';
import 'package:pdax_work_trial/core/resources/resources.dart';
import 'package:pdax_work_trial/features/person_list/data/data_sources/data_sources.dart';
import 'package:pdax_work_trial/features/person_list/data/models/models.dart';
import 'package:pdax_work_trial/features/person_list/domain/repository/repository.dart';

class PersonListRepositoryImpl implements PersonListRepository {
  PersonListRepositoryImpl(this._personListRemoteSource);

  final PersonListRemoteSource _personListRemoteSource;

  @override
  Future<DataState<PersonListModel>> getPersonList() async {
    try {
      final result = await _personListRemoteSource.fetchPersons();

      final data = PersonListModel.fromMap(result.data as Map<String, dynamic>);

      return DataSuccess(data);
    } catch (e) {
      return DataFailed(
        (e is GeneralException)
            ? OperationException(
                statusCode: e.code ?? 500,
                title: e.message,
                description: e.message,
              )
            : OperationException.general,
      );
    }
  }
}
