import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyco_test_flutter/views/widgets/FavoriteItem.dart';
import '../../view_models/FavouriteViewModel.dart';

class FavouriteList extends StatefulWidget {
  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  void initState() {
    Provider.of<FavouriteViewModel>(context, listen: false).fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: provider.persons != null
              ? ListView.builder(
                  itemCount: provider.persons.length,
                  itemBuilder: (context, index) {
                    var person = provider.persons[index];
                    return Container(
                        height: 100,
                        color: Colors.white,
                        child: Dismissible(
                          key: Key("${person.id}$index"),
                          child: FavoriteItem(
                            person: person,
                          ),
                          onDismissed: (direction) {
                            provider.remove(person);
                          },
                        ));
                  },
                )
              : Center(
                  child: Text('Favorite list is empty!'),
                )),
    );
  }
}
