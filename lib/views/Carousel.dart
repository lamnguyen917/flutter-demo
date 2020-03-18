import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        // store this controller in a State to save the carousel scroll position
        controller: PageController(viewportFraction: 1.2),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItem(context, itemIndex, itemIndex);
        },
        itemCount: 1,
        onPageChanged: (value) {
          print(value);
        },
      );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
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
