import 'dart:math';

void calculator (heightStr, weightStr) {

  var height = int.parse(heightStr);
  var weight = int.parse(weightStr);
  var result = weight / pow(height, 2); 
  print(result);
}