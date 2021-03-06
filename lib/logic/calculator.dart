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

enum Range { 
  unknown,
  underweight,
  normal,
  overweight,
  obese_I,
  obese_II,
  obese_III,
}

extension RangeExtention on Range {

  static final uppers = {
    Range.unknown: 10.0,
    Range.underweight: 18.5,
    Range.normal: 25.0,
    Range.overweight: 30.0,
    Range.obese_I: 35.0,
    Range.obese_II: 40.0,
    Range.obese_III: double.infinity,
  };

  double get upper => uppers[this];
}

Range getBMI(double bmi) {
  if (bmi != null) {
    for(Range range in Range.values ) {
      if( bmi < range.upper ) return range;
    }
  }
  return Range.unknown;
}
// Range getBMI(double bmi) {
//   return Range.values.firstWhere((range) => bmi < range.upper, orElse: () => Range.unknown);
// }