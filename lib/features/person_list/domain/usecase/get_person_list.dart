import 'package:pdax_work_trial/common/usecase/usecase.dart';
import 'package:pdax_work_trial/core/resources/resources.dart';
import 'package:pdax_work_trial/features/person_list/data/models/models.dart';
import 'package:pdax_work_trial/features/person_list/domain/repository/repository.dart';

class GetPersonListUseCase
    implements UseCase<DataState<PersonListModel>, void> {
  GetPersonListUseCase(this.repository);
  final PersonListRepository repository;

  @override
  Future<DataState<PersonListModel>> call({void params}) {
    return repository.getPersonList();
  }
}
