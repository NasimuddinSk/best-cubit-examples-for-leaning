import 'package:filter_listview_cubit/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  List<Person> persons = [];
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController countryTextEditingController =
      TextEditingController();

  PersonCubit() : super(PersonInitialState());

  void addPerson() {
    final String name = nameTextEditingController.text;
    final String country = countryTextEditingController.text;
    if (name.isNotEmpty || country.isNotEmpty) {
      persons.add(Person(name: name, address: country));
    }

    nameTextEditingController.clear();
    countryTextEditingController.clear();

    emit(PersonUpdatedState(persons: persons));
  }

  void removePerson({required int index}) {
    persons.removeAt(index);

    if (persons.isEmpty) {
      emit(PersonInitialState());
    } else {
      emit(PersonUpdatedState(persons: persons));
    }
  }

  void onDispose() {
    nameTextEditingController.dispose();
    countryTextEditingController.dispose();
  }
}
