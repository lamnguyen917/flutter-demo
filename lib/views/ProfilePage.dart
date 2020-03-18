import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/PersonViewModel.dart';
import 'InfoPanel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonViewModel>(context);
    print(provider.person.name);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          // child: Text(provider.name),
          child: InfoPanel(
            person: provider,
          ),
        ),
        onHorizontalDragEnd: (details) {
          double dx = details.velocity.pixelsPerSecond.dx;
          if (dx > 500) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Profile is added to favourite list!"),
            ));
          } else if (dx < -500) {
            print("Fetch new person");
            provider.fetchPerson();
          }
        },
      ),
    );
  }
}
