import 'package:flutter/material.dart';
import '../models/Person.dart';
import '../services/PersonProvider.dart';

class PersonViewModel extends ChangeNotifier {
  Person person = Person();

  // PersonViewModel() {
  //   fetchPerson();
  // }

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
}
