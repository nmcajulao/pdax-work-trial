// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'person_list_bloc.dart';

class PersonListState extends Equatable {
  const PersonListState({
    this.status = PersonListStatus.initial,
    this.persons = const [],
    this.page = 1,
  });

  /// person list state status
  final PersonListStatus status;

  /// fetched persons
  final List<PersonListDatumEntity> persons;

  /// pagination current page
  final int page;

  @override
  List<Object> get props => [
        status,
        persons,
      ];

  PersonListState copyWith({
    PersonListStatus? status,
    List<PersonListDatumEntity>? persons,
    int? page,
  }) {
    return PersonListState(
      status: status ?? this.status,
      persons: persons ?? this.persons,
      page: page ?? this.page,
    );
  }
}

enum PersonListStatus {
  initial,
  loading,
  moreLoading,
  loaded,
  error;

  bool get isInitial => this == PersonListStatus.initial;
  bool get isLoading => this == PersonListStatus.loading;
  bool get isLoadingMore => this == PersonListStatus.moreLoading;
  bool get isLoaded => this == PersonListStatus.loaded;
  bool get isError => this == PersonListStatus.error;
}
