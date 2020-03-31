import 'dart:math';

String calculator (dynamic heightStr, dynamic weightStr) {

  var height = int.parse(heightStr);
  var weight = int.parse(weightStr);
  var result = weight / pow(height, 2); 
  return result.toString();
}