import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  CustomCards({@required this.colours, this.cardChild, this.onPress});
  final List<Color> colours;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  //stops: [0.6, 0.4],
                  colors: colours,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: cardChild),
    );
  }
}
