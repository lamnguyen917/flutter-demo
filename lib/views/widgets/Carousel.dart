import 'package:flutter/material.dart';
import '../../models/Person.dart';

class Carousel extends StatelessWidget {
  final List<Person> persons;

  const Carousel({Key key, this.persons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // store this controller in a State to save the carousel scroll position
      controller: PageController(viewportFraction: 1.2),
      itemBuilder: (BuildContext context, int itemIndex) {
        return _buildCarouselItem(context, itemIndex, itemIndex);
      },
      itemCount: persons.length,
      onPageChanged: (value) {
        print(value);
      },
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}
