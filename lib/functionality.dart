import 'dart:math';

class Calculator {
  Calculator({this.weight, this.height});
  final int weight;
  final int height;
  double _bmi;
  String bmiCalc() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiCategory() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String bmiInterpretation() {
    if (_bmi >= 25) {
      return "You need to go to gym and watch that carbs!!!";
    } else if (_bmi > 18) {
      return "Good job keeping up a normal BMI, beleive me it's RARE!!!";
    } else {
      return "Dude, just start eating. Please!!!!";
    }
  }
}
