import 'package:test/test.dart';
import '../lib/calculator.dart';

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