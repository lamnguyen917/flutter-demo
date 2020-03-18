import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyco_test_flutter/view_models/PersonViewModel.dart';
// import 'package:pyco_test_flutter/views/Carousel.dart';
import '../views/ProfilePage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 150,
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  color: Color(0xFFCCCCCC),
                ),
              )
            ],
          ),
          // Carousel(),
          ChangeNotifierProvider(
            create: (context) => PersonViewModel(),
            child: ProfilePage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        children: <Widget>[
          Tab(
            icon: Icon(Icons.home),
            text: "Home",
          ),
          Tab(
            icon: Icon(Icons.home),
            text: "Home",
          ),
        ],
      )),
    );
  }
}
