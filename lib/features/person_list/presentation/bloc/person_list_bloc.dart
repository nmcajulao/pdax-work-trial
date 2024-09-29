import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_work_trial/core/resources/resources.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';
import 'package:pdax_work_trial/features/person_list/domain/usecase/get_person_list.dart';

part 'person_list_event.dart';
part 'person_list_state.dart';

class PersonListBloc extends Bloc<PersonListEvent, PersonListState> {
  PersonListBloc(this._getPersonListUseCase) : super(const PersonListState()) {
    on<PersonListInitialFetched>(_onInitialFetched);
    on<PersonListMorePeopleLoaded>(_onMorePeopleLoaded);
    on<PersonListRefreshed>(_onRefreshed);
  }
  final GetPersonListUseCase _getPersonListUseCase;

  int _getStartingIndex(int page) {
    var start = 0;

    if (page == 1) {
      start = 10;
    } else {
      final moreMultiplier = page - 2;

      start = 10 + (moreMultiplier * 20);
    }

    return start;
  }

  Future<void> _onInitialFetched(
    PersonListInitialFetched event,
    Emitter<PersonListState> emit,
  ) async {
    emit(state.copyWith(status: PersonListStatus.loading));

    final dataState = await _getPersonListUseCase();

    if (dataState is DataSuccess) {
      final data = dataState.data;
      if (data != null && (data.data ?? []).isNotEmpty) {
        final persons = (data.data ?? []).sublist(0, 10);

        emit(
          state.copyWith(
            status: PersonListStatus.loaded,
            persons: persons,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: PersonListStatus.error,
          ),
        );
      }
    } else if (dataState is DataFailed) {
      emit(
        state.copyWith(
          status: PersonListStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: PersonListStatus.error,
        ),
      );
    }
  }

  Future<void> _onMorePeopleLoaded(
    PersonListMorePeopleLoaded event,
    Emitter<PersonListState> emit,
  ) async {
    if (state.page == 4) {
      emit(state.copyWith(status: PersonListStatus.noMoreData));
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: PersonListStatus.loaded));
      return;
    }

    emit(state.copyWith(status: PersonListStatus.moreLoading));

    final dataState = await _getPersonListUseCase();

    if (dataState is DataSuccess) {
      final data = dataState.data;
      if (data != null && (data.data ?? []).isNotEmpty) {
        final page = state.page + 1;
        final start = _getStartingIndex(page);
        final end = start + 20;

        final persons = (data.data ?? []).sublist(
          start,
          end,
        );

        emit(
          state.copyWith(
            status: PersonListStatus.loaded,
            persons: [...state.persons, ...persons],
            page: page,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: PersonListStatus.error,
          ),
        );
      }
    } else if (dataState is DataFailed) {
      emit(
        state.copyWith(
          status: PersonListStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: PersonListStatus.error,
        ),
      );
    }
  }

  Future<void> _onRefreshed(
    PersonListRefreshed event,
    Emitter<PersonListState> emit,
  ) async {
    emit(state.copyWith(status: PersonListStatus.loading));

    final dataState = await _getPersonListUseCase();

    if (dataState is DataSuccess) {
      final data = dataState.data;
      if (data != null && (data.data ?? []).isNotEmpty) {
        final persons = (data.data ?? []).sublist(0, 10);

        emit(
          state.copyWith(
            status: PersonListStatus.loaded,
            persons: persons,
            page: 1,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: PersonListStatus.error,
          ),
        );
      }
    } else if (dataState is DataFailed) {
      emit(
        state.copyWith(
          status: PersonListStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: PersonListStatus.error,
        ),
      );
    }
  }
}
