import 'package:pyco_test_flutter/services/DatabaseHelper.dart';
// import 'package:pyco_test_flutter/utils/DateUtils.dart';

class Person {
  int id;
  String name;
  String dob;
  String address;
  String phone;
  String status;
  String picture;

  Person({
    this.id = 0,
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

  Person.clone(Person person) {
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
      id: int.parse(data["id"]["value"]),
      name: fullName,
      // dob: DateUtils.fromTimestamp(data["dob"]),
      dob: data["dob"],
      address: data["location"]["street"],
      phone: data["cell"],
      status: data["registered"],
      // picture: data["picture"],
      picture: data["picture"]["large"],
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colDob: dob,
      colAddress: address,
      colPhone: phone,
      colStatus: status,
      colPicture: picture
    };
    if (id > 0) {
      map[colId] = id;
    }
    return map;
  }

  Person.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    dob = map[colDob];
    address = map[colAddress];
    phone = map[colPhone];
    status = map[colStatus];
    picture = map[colPicture];
  }
}
