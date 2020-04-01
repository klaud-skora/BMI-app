import 'package:test/test.dart';
import '../lib/calculator.dart';

void main() {

 test('empty arguments return error', () {
    var result = calculator('','');
    expect(result, 'Arguments can\'t be empty.');
 });
 
}