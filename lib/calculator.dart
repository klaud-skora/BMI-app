import 'dart:math';

double calculator (String heightStr, String weightStr, {bool state = false} ) {

  var result;
  if(heightStr != null && weightStr != null && (double.tryParse(heightStr) != null && double.tryParse(weightStr) != null) ) {    
    var height = int.parse(heightStr);
    var weight = int.parse(weightStr);

    if(height <= 0 || weight <= 0) {
      return result;
    }
    if(state) {
      result = ((703 * (weight / pow(height, 2)))* 100).round() / 100; 
    } else {
      result = ((weight / pow(height * 0.01, 2))* 100).round() / 100;  
    }
  }
  return result;
  
}