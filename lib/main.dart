import 'package:flutter/material.dart';

import 'input.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xff011627),
            //accentColor: Color(0xffC44C3B),
            scaffoldBackgroundColor: Color(0xff001015)),
        home: Input()),
  );
}
