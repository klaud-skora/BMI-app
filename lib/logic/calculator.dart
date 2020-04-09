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
    Range.unknown: 9.9,
    Range.underweight: 18.5,
    Range.normal: 24.9,
    Range.overweight: 29.9,
    Range.obese_I: 34.9,
    Range.obese_II: 39.9,
    Range.obese_III: double.infinity,
  };

 static final types = {
    Range.unknown: '',
    Range.underweight: 'Underweight',
    Range.normal: 'Normal weight',
    Range.overweight: 'Overweight',
    Range.obese_I: 'Obesity level I',
    Range.obese_II: 'Obesity level II',
    Range.obese_III: 'Obesity level III'
  };

  double get upper => uppers[this];
  String get type => types[this];

}

getBMI(bmi) {
  if (bmi == null) return Range.unknown.type;
  for(Range range in Range.values ) {
    if( bmi <= range.upper) return range.type;
  }
}