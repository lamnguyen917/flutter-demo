import 'package:flutter/material.dart';
import 'package:pyco_test_flutter/services/DatabaseHelper.dart';
import '../models/Person.dart';
import '../services/PersonProvider.dart';

class PersonViewModel extends ChangeNotifier {
  Person person = Person();

  String get name {
    return this.person.name;
  }

  String get dob {
    return this.person.dob;
  }

  String get address {
    return this.person.address;
  }

  String get phone {
    return this.person.phone;
  }

  String get status {
    return this.person.status;
  }

  String get picture {
    return this.person.picture;
  }

  Future<void> fetchPerson() async {
    final result = await PersonProvider.getResult();
    this.person = Person.fromJson(result);
    notifyListeners();
  }

  Future<String> save() async {
    try {
      DatabaseHelper helper = DatabaseHelper.instance;
      var res = await helper.insert(person);
      if (res == DB_ERROR_UNIQUE)
        return "This person is already in the favorite list!";
      if (res < 0) return "Unknown error occurred!";
      return "Profile ${person.id} is added to favourite list!";
    } catch (e) {
      print(e);
      return "Unknown error occurred!";
    }
  }
}
