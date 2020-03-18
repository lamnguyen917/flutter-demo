import 'package:flutter/material.dart';
import '../services/DatabaseHelper.dart';
import '../models/Person.dart';

class FavouriteViewModel extends ChangeNotifier {
  List<Person> persons;

  Future<void> fetch() async {
    final result = await DatabaseHelper.instance.queryFavouriteList();
    print(result);
    this.persons = result.toList();
    notifyListeners();
  }
}
