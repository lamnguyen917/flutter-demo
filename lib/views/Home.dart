import 'package:flutter/material.dart';
import './pages/FavouritePage.dart';
import './pages/ProfilePage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showFavourite = false;
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
          Visibility(
            child: FavouritePage(),
            visible: showFavourite,
          ),
          Visibility(
            child: ProfilePage(),
            visible: !showFavourite,
          ),
          // showFavourite ? FavouritePage() : ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.info,
                color: showFavourite ? Colors.grey : Colors.green,
              ),
              onPressed: () {
                setState(() {
                  showFavourite = false;
                });
              },
            ),
            FlatButton(
              child: Icon(
                Icons.favorite,
                color: showFavourite ? Colors.green : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  showFavourite = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
