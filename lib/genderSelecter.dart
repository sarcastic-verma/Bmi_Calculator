import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  GenderSelector({this.g, this.l});
  final IconData g;
  final String l;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          g,
          size: 105.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          l,
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        )
      ],
    );
  }
}
