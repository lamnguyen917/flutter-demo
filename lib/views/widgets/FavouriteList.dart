import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          // child: Carousel(
          //   persons: provider.persons,
          // ),
          child: provider.persons != null
              ? ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: provider.persons.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: new NetworkImage(
                                    provider.persons[index].picture),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Name: ${provider.persons[index].name}'),
                                Text('DOB: ${provider.persons[index].dob}'),
                                Text('Address: ${provider.persons[index].address}'),
                                Text('Phone: ${provider.persons[index].phone}'),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Text('Favorite list is empty!'),
                )),
    );
  }
}
