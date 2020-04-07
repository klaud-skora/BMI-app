import 'dart:math';

abstract class Calculator {
  bool areNull(height, weight) {
    return height == null || weight == null; 
  }

  bool areArgsPositive(height, weight) {
    return height > 0 && weight > 0;
  }

  double calculator(height, weight) {
    if(areNull(height, weight)) return null;
    return areArgsPositive(height, weight) 
      ? bmi(height, weight) 
      : null;
  }

  double bmi(height, weight);
}

class MetricCalculator extends Calculator {
  bmi(height, weight) {
    return ((weight / pow(height * 0.01, 2))* 100).round() / 100;
  } 
}

class ImperialCalculator extends Calculator {
  bmi(height, weight) {
    return ((703 * (weight / pow(height, 2)))* 100).round() / 100; 
  }
}