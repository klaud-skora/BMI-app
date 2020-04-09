import '../logic/calculator.dart';

extension TypeExtension on Range {
  static final types = {
    Range.unknown: '',
    Range.underweight: 'Underweight',
    Range.normal: 'Normal weight',
    Range.overweight: 'Overweight',
    Range.obese_I: 'Obesity level I',
    Range.obese_II: 'Obesity level II',
    Range.obese_III: 'Obesity level III'
  };

  String get type => types[this];
}

String getType(Range range) {
  return range.type;
}