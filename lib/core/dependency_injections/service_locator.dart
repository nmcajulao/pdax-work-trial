import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pdax_work_trial/features/person_list/data/data_sources/data_sources.dart';
import 'package:pdax_work_trial/features/person_list/data/repository/repository.dart';
import 'package:pdax_work_trial/features/person_list/domain/repository/repository.dart';
import 'package:pdax_work_trial/features/person_list/domain/usecase/get_person_list.dart';
import 'package:pdax_work_trial/features/person_list/presentation/bloc/bloc.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  static void setupServiceLocator() {
    // * Dio
    serviceLocator
      ..registerSingleton<Dio>(Dio())

      // * Sources
      ..registerSingleton<PersonListRemoteSource>(
        PersonListRemoteSource(),
      )

      // * Repositories
      ..registerSingleton<PersonListRepository>(
        PersonListRepositoryImpl(
          serviceLocator(),
        ),
      )

      // * Blocs
      ..registerFactory<PersonListBloc>(
        () => PersonListBloc(
          serviceLocator(),
        ),
      )

      // * UseCases
      ..registerSingleton<GetPersonListUseCase>(
        GetPersonListUseCase(
          serviceLocator(),
        ),
      );
  }
}
