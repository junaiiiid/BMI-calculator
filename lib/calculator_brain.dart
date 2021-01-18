import 'dart:math';

class CalculatorBrain {
  int _height;
  int _weight;

  void setHeight(height) {
    _height = height;
  }

  void setWeight(weight) {
    _weight = weight;
  }

  double BMI() {
    return _weight / pow((_height / 100), 2);
  }

  String getResult() {
    if (BMI() >= 25) {
      return 'Overweight';
    } else if (BMI() > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSummary() {
    if (BMI() >= 25) {
      return 'You have a higher than normal body weight, try to exercise more';
    } else if (BMI() > 18.5) {
      return 'You have a normal body weight, Good job !';
    } else {
      return 'You have a lower than normal body weight, try to eat more';
    }
  }
}
