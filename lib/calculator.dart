import 'dart:math';

abstract class Calculator {
  int height;
  int weight;
  bool positive;
  //Calculator({this.height, this.weight});

  areArgsPositive(height, weight) {
    if(height > 0 && weight > 0) positive = true;
    else positive = false;
  }
  calculator(double height, double weight);
}

class MetricCalculator implements Calculator {
  int height;
  int weight;
  double result;
  bool positive;

  areArgsPositive(height, weight) {
    if(height > 0 && weight > 0) positive = true;
    else positive = false;
  }

  calculator(double height, double weight) {
    areArgsPositive(height, weight);
    return positive ? ((weight / pow(height * 0.01, 2))* 100).round() / 100 : null;
  }
  
}

class ImperialCalculator implements Calculator {
  int height;
  int weight;
  double result;
  bool positive;

  areArgsPositive(height, weight) {
    if(height > 0 && weight > 0) positive = true;
    else positive = false;
  }

  calculator(height, weight) {
    areArgsPositive(height, weight);
    return positive ? ((703 * (weight / pow(height, 2)))* 100).round() / 100 : null; 
  }
}