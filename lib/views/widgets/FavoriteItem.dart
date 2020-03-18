import 'package:flutter/material.dart';
import 'package:pyco_test_flutter/models/Person.dart';

class FavoriteItem extends StatelessWidget {
  final Person person;

  const FavoriteItem({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        color: Colors.lightGreenAccent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(person.picture),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Name: ${person.name}'),
                  Text('DOB: ${person.dob}'),
                  Text('Address: ${person.address}'),
                  Text('Phone: ${person.phone}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
