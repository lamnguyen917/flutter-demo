import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyco_test_flutter/services/DatabaseHelper.dart';
import 'InfoPanel.dart';
import '../../view_models/PersonViewModel.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  void initState() {
    Provider.of<PersonViewModel>(context, listen: false).fetchPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonViewModel>(context);
    var infoPanel = InfoPanel(
      personVM: provider,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: infoPanel,
        ),
        onHorizontalDragEnd: (details) {
          double dx = details.velocity.pixelsPerSecond.dx;
          if (dx > 500) {
            infoPanel.save((res) {
              var message = "Profile $res is added to favourite list!";
              if (res == DB_ERROR_UNIQUE)
                message = "This person is already in the favorite list!";
              else if (res < 0)
                message = "Unknown error occurred!";
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(message),
              ));
            });
          } else if (dx < -500) {
            provider.fetchPerson();
          }
        },
      ),
    );
  }
}
