import 'package:test/test.dart';
import '../lib/calculator.dart';

void main() {

 test('empty arguments should return empty string', () {
    var result = calculator('','');
    expect(result, '');
 });

 test('strings with other signs than numbers should return empty string', () {
    var result = calculator('abc','abc');
    expect(result, '');
 });
}