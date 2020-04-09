import 'package:test/test.dart';
import '../lib/logic/calculator.dart';

void main() {
  Calculator metric = MetricCalculator();
  Calculator imperial = ImperialCalculator();

  // tests for MetricCalculator

  test('test good input', () {
    var result = metric.calculator(180, 65);
    expect(result, 20.06);
  });

  test('test null input for height', () {
    var result = metric.calculator(null,60);
    expect(result, null);
  });

  test('test null input for weight', () {
    var result = metric.calculator(180, null);
    expect(result, null);
  });

  test('test null input for height & weight', () {
    var result = metric.calculator(null, null);
    expect(result, null);
  });

  test('test negative height', () {
    var result = metric.calculator(-180, 65);
    expect(result, null);
  });

  test('test negative weight', () {
    var result = metric.calculator(180, -65);
    expect(result, null);
  });

  test('test negative height & weight', () {
    var result = metric.calculator(-180, -65);
    expect(result, null);
  });

  test('test zero height', () {
    var result = metric.calculator(0, 65);
    expect(result, null);
  });

  test('test zero weight', () {
    var result = metric.calculator(180, 0);
    expect(result, null);
  });

  test('test zero height & weight', () {
    var result = metric.calculator(0, 0);
    expect(result, null);
  });

  test('unknown', () {
    final range = getBMI(8);
    expect(range, Range.unknown);
  });

  test('underweight', () {
    final range = getBMI(17);
    expect(range, Range.underweight);
  });

  test('underweight - normal edge', () {
    final range = getBMI(18.45);
    expect(range, Range.underweight);
  });

  test('normal', () {
    final range = getBMI(20);
    expect(range, Range.normal);
  });

  test('normal - overweight edge', () {
    final range = getBMI(24.95);
    expect(range, Range.normal);
  });

  test('overweight', () {
    final range = getBMI(27);
    expect(range, Range.overweight);
  });

  test('overweight - obese I edge', () {
    final range = getBMI(29.95);
    expect(range, Range.overweight);
  });

  test('obese I', () {
    final range = getBMI(32);
    expect(range, Range.obese_I);
  });

  test('obese I - obese II edge', () {
    final range = getBMI(34.95);
    expect(range, Range.obese_I);
  });

  test('obese II', () {
    final range = getBMI(37);
    expect(range, Range.obese_II);
  });

  test('obese I - obese II edge', () {
    final range = getBMI(39.95);
    expect(range, Range.obese_II);
  });

  test('obese III', () {
    final range = getBMI(45);
    expect(range, Range.obese_III);
  });

  // tests for ImperialCalculator

  test('test good input', () {
    var result = imperial.calculator(70.87, 143.3);
    expect(result, 20.06);
  });

  test('test null input for height', () {
    var result = imperial.calculator(null, 143.3);
    expect(result, null);
  });

  test('test null input for weight', () {
    var result = imperial.calculator(70.87, null);
    expect(result, null);
  });

  test('test null input for height & weight', () {
    var result = imperial.calculator(null, null);
    expect(result, null);
  });

  test('test negative height', () {
    var result = imperial.calculator(-70.87, 143.3);
    expect(result, null);
  });

  test('test negative weight', () {
    var result = imperial.calculator(70.87, -143.3);
    expect(result, null);
  });

  test('test negative height & weight', () {
    var result = imperial.calculator(-70.87, -143.3);
    expect(result, null);
  });

  test('test zero height', () {
    var result = imperial.calculator(0, 143.3);
    expect(result, null);
  });

  test('test zero weight', () {
    var result = imperial.calculator(70.87, 0);
    expect(result, null);
  });

  test('test zero height & weight', () {
    var result = imperial.calculator(0, 0);
    expect(result, null);
  });

}