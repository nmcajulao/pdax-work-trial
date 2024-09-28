part of 'person_list_bloc.dart';

sealed class PersonListEvent extends Equatable {
  const PersonListEvent();

  @override
  List<Object> get props => [];
}

class PersonListInitialFetched extends PersonListEvent {}

class PersonListMorePeopleLoaded extends PersonListEvent {}

class PersonListRefreshed extends PersonListEvent {}
