import 'package:flutter/material.dart';
import '../logic/calculator.dart';

class BmiIndicator extends StatelessWidget {
  
  final double bmi;
  BmiIndicator({this.bmi});

  @override
  Widget build(BuildContext context) {
    Range range = getBMI(bmi);
    return Text(
      '${bmi != null ? bmi : ''}',
      style: TextStyle(
        color: range == Range.normal ? Colors.green 
        : (range == Range.underweight || range == Range.overweight ? Colors.yellow 
        : (range == Range.obese_I  ? Colors.red[100] : range == Range.obese_II ? Colors.red[200] : Colors.red[300] )),
        shadows: <Shadow>[
          Shadow(
            offset: Offset(.1, .1),
            blurRadius: 5.0,
            color: Colors.black,
          ),
        ],
        fontSize: 25,
      ),
    );
  }
}
