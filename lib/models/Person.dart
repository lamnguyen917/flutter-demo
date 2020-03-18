import 'package:pyco_test_flutter/utils/DateUtils.dart';

class Person {
  String name;
  String dob;
  String address;
  String phone;
  String status;
  String picture;

  Person({
    this.name = "",
    this.dob = "",
    this.address = "",
    this.phone = "",
    this.status = "",
    this.picture = "",
  });

  void load(Person person) {
    this.name = person.name;
    this.dob = person.dob;
    this.address = person.address;
    this.phone = person.phone;
    this.status = person.status;
    this.picture = person.picture;
  }

  factory Person.fromJson(Map<String, dynamic> data) {
    final Map<String, dynamic> nameObj = data["name"];
    final String fullName =
        "${nameObj["title"]} ${nameObj["first"]} ${nameObj["last"]}";
    return Person(
      name: fullName,
      dob: DateUtils.fromTimestamp(data["dob"]),
      address: data["location"]["street"],
      phone: data["cell"],
      status: "",
      picture: data["picture"],
    );
  }
}
