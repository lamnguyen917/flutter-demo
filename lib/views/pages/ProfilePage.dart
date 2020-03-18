import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/ProfileContent.dart';
import '../../view_models/PersonViewModel.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonViewModel(),
      child: ProfileContent(),
    );
  }
}
