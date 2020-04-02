// import 'package:test/test.dart';
// import '../lib/calculator.dart';

// void main() {

//  test('empty arguments should return empty string', () {
//     var result = calculator('','');
//     expect(result, null);
//  });

//  test('strings with other signs than numbers should return empty string', () {
//     var result = calculator('abc','abc');
//     expect(result, null);
//  });

//   test('test null input for height', () {
//    var result = calculator(null,'60');
//    expect(result, null);
//  });

//  test('test null input for weight', () {
//    var result = calculator('180', null);
//    expect(result, null);
//  });

//  test('test null input for height & weight', () {
//    var result = calculator(null, null);
//    expect(result, null);
//  });

//  test('test good input', () {
//    var result = calculator('180', '65');
//    expect(result, 20.06);
//  });

//  test('test negative height', () {
//    var result = calculator('-180', '65');
//    expect(result, null);
//  });

//  test('test negative weight', () {
//    var result = calculator('180', '-65');
//    expect(result, null);
//  });

//  test('test negative height & weight', () {
//    var result = calculator('-180', '-65');
//    expect(result, null);
//  });

//  test('test zero height', () {
//    var result = calculator('0', '65');
//    expect(result, null);
//  });

//  test('test zero weight', () {
//    var result = calculator('180', '0');
//    expect(result, null);
//  });

//  test('test zero height & weight', () {
//    var result = calculator('0', '0');
//    expect(result, null);
//  });
//  test('test zero height & weight', () {
//    var result = calculator('0', '0');
//    expect(result, null);
//  });

// }