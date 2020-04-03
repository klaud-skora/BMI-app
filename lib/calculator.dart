import 'dart:math';

abstract class Calculator {
  int height;
  int weight;
  bool isNull;
  bool positive;
  
  areNull(height, weight);

  areArgsPositive(height, weight) {
    if(height > 0 && weight > 0) positive = true;
    else positive = false;
  }
  calculator(height, weight);
}

class MetricCalculator implements Calculator {
  int height;
  int weight;
  double result;
  bool isNull = false;
  bool positive = true;

  areNull(height, weight) {
    if(height == null || weight == null) isNull = true; 
  }

  void areArgsPositive(height, weight) {
    if(height <= 0 || weight <= 0) positive = false;
  }

  calculator(height, weight) {
    areNull(height, weight);
    if(isNull) return null;
    areArgsPositive(height, weight);
    return positive ? ((weight / pow(height * 0.01, 2))* 100).round() / 100 : null;
  }
}

class ImperialCalculator implements Calculator {
  int height;
  int weight;
  double result;
  bool isNull = false;
  bool positive = true;

  areNull(height, weight) {
    if(height == null || weight == null) isNull = true; 
  }

  areArgsPositive(height, weight) {
    if(height <= 0 || weight <= 0) positive = false;
  }

  calculator(height, weight) {
    areNull(height, weight);
    if(isNull) return null;
    areArgsPositive(height, weight);

    return positive ? ((703 * (weight / pow(height, 2)))* 100).round() / 100 : null; 
  }
}