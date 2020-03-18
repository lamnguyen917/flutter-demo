import 'package:flutter/material.dart';
import '../view_models/PersonViewModel.dart';
// import '../models/Person.dart';

const double TOP_HEIGHT = 125;
const double PIC_SIZE = 150;
const double PIC_TOP = 25;
const double BUTTON_HEIGHT = 50;

class InfoPanel extends StatefulWidget {
  final PersonViewModel person;

  InfoPanel({this.person});

  @override
  _InfoPanelState createState() => _InfoPanelState();
}

enum InfoState { NAME, DOB, ADDRESS, PHONE, STATUS }

class _InfoPanelState extends State<InfoPanel> {
  String title = "";
  String info = "";
  InfoState state = InfoState.NAME;

  String getTitle(InfoState state) {
    switch (state) {
      case InfoState.NAME:
        return "My name is:";
      case InfoState.DOB:
        return "My DOB is:";
      case InfoState.ADDRESS:
        return "My address is:";
      case InfoState.PHONE:
        return "My phone number is:";
      case InfoState.STATUS:
        return "My status is:";
      default:
        return "My name is:";
    }
  }

  String getInfo(InfoState state) {
    switch (state) {
      case InfoState.NAME:
        return widget.person.name;
      case InfoState.DOB:
        return widget.person.dob;
      case InfoState.ADDRESS:
        return widget.person.address;
      case InfoState.PHONE:
        return widget.person.phone;
      case InfoState.STATUS:
        return widget.person.status;
      default:
        return widget.person.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: TOP_HEIGHT,
              decoration: BoxDecoration(
                color: Color(0xFFCCCCCC),
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          getTitle(state),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          getInfo(state),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    buttonHeight: BUTTON_HEIGHT,
                    alignment: MainAxisAlignment.spaceAround,
                    buttonMinWidth: BUTTON_HEIGHT,
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.person,
                          color: this.state == InfoState.NAME
                              ? Colors.green
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            this.state = InfoState.NAME;
                          });
                        },
                      ),
                      FlatButton(
                        child: Icon(
                          Icons.calendar_today,
                          color: this.state == InfoState.DOB
                              ? Colors.green
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            this.state = InfoState.DOB;
                          });
                        },
                      ),
                      FlatButton(
                        child: Icon(
                          Icons.map,
                          color: this.state == InfoState.ADDRESS
                              ? Colors.green
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            this.state = InfoState.ADDRESS;
                          });
                        },
                      ),
                      FlatButton(
                        child: Icon(
                          Icons.phone,
                          color: this.state == InfoState.PHONE
                              ? Colors.green
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            this.state = InfoState.PHONE;
                          });
                        },
                      ),
                      FlatButton(
                        child: Icon(
                          Icons.lock,
                          color: this.state == InfoState.STATUS
                              ? Colors.green
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            this.state = InfoState.STATUS;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: PIC_TOP,
          child: Container(
            height: PIC_SIZE,
            width: PIC_SIZE,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              border: Border.all(
                width: 1,
                color: Colors.grey,
                style: BorderStyle.solid,
              ),
              // shape: BoxShape.circle,
              // color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    image: new NetworkImage(widget.person.picture),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
