import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'customCards.dart';
import 'functionality.dart';
import 'genderSelecter.dart';
import 'results.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

enum gender { Male, Female }

class _InputState extends State<Input> {
  gender selected;
  int weight = 60;
  int age = 18;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCards(
                    onPress: () {
                      setState(() {
                        selected = gender.Male;
                      });
                    },
                    cardChild:
                        GenderSelector(g: FontAwesomeIcons.mars, l: "MALE"),
                    colours:
                        selected == gender.Male ? selectedcard : activecard,
                  ),
                ),
                Expanded(
                  child: CustomCards(
                    onPress: () {
                      setState(() {
                        selected = gender.Female;
                      });
                    },
                    colours:
                        selected == gender.Female ? selectedcard : activecard,
                    cardChild:
                        GenderSelector(g: FontAwesomeIcons.venus, l: "FEMALE"),
                  ),
                ),
              ],
            )),
            Expanded(
              child: CustomCards(
                colours: activecard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.blueGrey,
                          thumbColor: Colors.pink,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        max: 220.0,
                        min: 120.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: CustomCards(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  fontSize: 45.0, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "KG",
                              style: TextStyle(fontSize: 20.0),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomButton(
                              onPressed: () {
                                setState(() {
                                  if (weight <= 0) {
                                    weight = 0;
                                  } else {
                                    weight--;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colours: activecard,
                  )),
                  Expanded(
                      child: CustomCards(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  fontSize: 45.0, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomButton(
                              onPressed: () {
                                setState(() {
                                  if (age <= 0) {
                                    age = 0;
                                  } else {
                                    age--;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colours: activecard,
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculator calc = Calculator(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => result_page(
                              result: calc.bmiCalc(),
                              Interpretation: calc.bmiInterpretation(),
                              Category: calc.bmiCategory(),
                            )));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                decoration:
                    BoxDecoration(gradient: LinearGradient(colors: okbutton)),
                height: 80.0,
                width: double.maxFinite,
                child: Center(
                    child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  CustomButton({@required this.onPressed, @required this.icon});
  final IconData icon;
  final Function onPressed;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 10.0,
      fillColor: Colors.pink,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

