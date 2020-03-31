import 'dart:math';

String calculator (String heightStr, String weightStr) {

  var height = int.parse(heightStr);
  var weight = int.parse(weightStr);
  var result = (weight / pow(height * 0.01, 2)).toStringAsFixed(2); 
  return result;
}