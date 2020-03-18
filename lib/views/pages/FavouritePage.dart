import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/FavouriteViewModel.dart';
import '../widgets/FavouriteList.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteViewModel(),
      child: FavouriteList(),
    );
  }
}
