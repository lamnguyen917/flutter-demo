import 'package:flutter/material.dart';
import '../../view_models/PersonViewModel.dart';

const double TOP_HEIGHT = 125;
const double PIC_SIZE = 150;
const double PIC_TOP = 25;
const double BUTTON_HEIGHT = 50;

class InfoPanel extends StatefulWidget {
  final PersonViewModel personVM;

  const InfoPanel({Key key, this.personVM}) : super(key: key);

  @override
  _InfoPanelState createState() => _InfoPanelState();
}

enum InfoState { NAME, DOB, ADDRESS, PHONE, STATUS }

class _TabInfo {
  final InfoState state;
  final String headline;
  final IconData iconData;

  _TabInfo({this.state, this.headline, this.iconData});
}

class _InfoPanelState extends State<InfoPanel> {
  String title = "";
  String info = "";
  InfoState state = InfoState.NAME;

  final List<_TabInfo> tabsInfo = <_TabInfo>[
    _TabInfo(
        state: InfoState.NAME, headline: "My name is:", iconData: Icons.person),
    _TabInfo(
        state: InfoState.DOB,
        headline: "My DOB is:",
        iconData: Icons.calendar_today),
    _TabInfo(
        state: InfoState.ADDRESS,
        headline: "My address is:",
        iconData: Icons.map),
    _TabInfo(
        state: InfoState.PHONE,
        headline: "My phone number is:",
        iconData: Icons.phone),
    _TabInfo(
        state: InfoState.STATUS,
        headline: "My status is:",
        iconData: Icons.lock),
  ];

  String getTitle(InfoState state) {
    return tabsInfo.firstWhere((element) => (element.state == state)).headline;
  }

  String getInfo(InfoState state) {
    switch (state) {
      case InfoState.NAME:
        return widget.personVM.name;
      case InfoState.DOB:
        return widget.personVM.dob;
      case InfoState.ADDRESS:
        return widget.personVM.address;
      case InfoState.PHONE:
        return widget.personVM.phone;
      case InfoState.STATUS:
        return widget.personVM.status;
      default:
        return widget.personVM.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    var tabs = new List.generate(tabsInfo.length, (index) {
      var e = tabsInfo[index];
      return FlatButton(
          onPressed: () {
            setState(() {
              state = e.state;
            });
          },
          child: Icon(e.iconData,
              color: state == e.state ? Colors.green : Colors.grey));
    });

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
                    children: tabs,
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
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: widget.personVM.picture.length > 0
                      ? DecorationImage(
                          image: new NetworkImage(widget.personVM.picture),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
