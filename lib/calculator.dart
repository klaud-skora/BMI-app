import 'dart:math';

abstract class Calculator {
  int height;
  int weight;
  bool isNull;
  bool positive;
  
  areNull(height, weight) {
    if(height == null || weight == null) isNull = true; 
  }

  areArgsPositive(height, weight) {
    if(height <= 0 || weight <= 0) positive = false;
  }
  calculator(height, weight);
}

class MetricCalculator extends Calculator {
  int height;
  int weight;
  bool isNull = false;
  bool positive = true;

  calculator(height, weight) {
    areNull(height, weight);
    if(isNull) return null;
    areArgsPositive(height, weight);
    return positive ? ((weight / pow(height * 0.01, 2))* 100).round() / 100 : null;
  }
}

class ImperialCalculator extends Calculator {
  int height;
  int weight;
  bool isNull = false;
  bool positive = true;

  calculator(height, weight) {
    areNull(height, weight);
    if(isNull) return null;
    areArgsPositive(height, weight);

    return positive ? ((703 * (weight / pow(height, 2)))* 100).round() / 100 : null; 
  }
}