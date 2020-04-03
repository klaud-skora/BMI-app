import 'package:test/test.dart';
import '../lib/calculator.dart';

void main() {
Calculator calculator = MetricCalculator();

 test('test good input', () {
   var result = calculator.calculator(180, 65);
   expect(result, 20.06);
 });

  test('test null input for height', () {
   var result = calculator.calculator(null,60);
   expect(result, null);
 });

 test('test null input for weight', () {
   var result = calculator.calculator(180, null);
   expect(result, null);
 });

 test('test null input for height & weight', () {
   var result = calculator.calculator(null, null);
   expect(result, null);
 });

 test('test negative height', () {
   var result = calculator.calculator(-180, 65);
   expect(result, null);
 });

 test('test negative weight', () {
   var result = calculator.calculator(180, -65);
   expect(result, null);
 });

 test('test negative height & weight', () {
   var result = calculator.calculator(-180, -65);
   expect(result, null);
 });

 test('test zero height', () {
   var result = calculator.calculator(0, 65);
   expect(result, null);
 });

 test('test zero weight', () {
   var result = calculator.calculator(180, 0);
   expect(result, null);
 });

 test('test zero height & weight', () {
   var result = calculator.calculator(0, 0);
   expect(result, null);
 });

}