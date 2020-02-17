import 'package:flutter/material.dart';

import 'constants.dart';
import 'customCards.dart';

class result_page extends StatelessWidget {
  result_page(
      {@required this.Category,
      @required this.result,
      @required this.Interpretation});
  final String result;
  final String Category;
  final String Interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: CustomCards(
                colours: activecard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      Category,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      result,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0, color: Colors.grey),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                  decoration:
                      BoxDecoration(gradient: LinearGradient(colors: okbutton)),
                  height: 80.0,
                  width: double.maxFinite,
                  child: Center(
                      child: Text(
                    "RE-CALCULATE",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                )),
          )
        ],
      ),
    );
  }
}
