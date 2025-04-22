part of 'person_cubit.dart';

sealed class PersonState {
  PersonState();
}

final class PersonInitialState extends PersonState {}

final class PersonUpdatedState extends PersonState {
  final List<Person> persons;
  PersonUpdatedState({required this.persons});
}
