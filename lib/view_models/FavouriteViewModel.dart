import 'package:flutter/material.dart';
import '../services/DatabaseHelper.dart';
import '../models/Person.dart';

class FavouriteViewModel extends ChangeNotifier {
  List<Person> persons;

  void remove(Person person) {
    DatabaseHelper.instance.remove(person.id);
    persons.remove(person);
    notifyListeners();
  }

  Future<void> fetch() async {
    final result = await DatabaseHelper.instance.queryFavouriteList();
    this.persons = result.toList();
    notifyListeners();
  }
}
