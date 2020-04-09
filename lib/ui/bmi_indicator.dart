import 'package:flutter/material.dart';
import '../logic/calculator.dart';

class BmiIndicator extends StatelessWidget {
  
  final double bmi;
  BmiIndicator({this.bmi});

  @override
  Widget build(BuildContext context) {
    Range range = getBMI(bmi);
    var color;

    switch(range) {
      case Range.normal:
        color = Colors.green;
        break;
      case Range.underweight:
      case Range.overweight:
        color = Colors.yellow;
        break;
      case Range.unknown:
      case Range.obese_I:
        color = Colors.red[100];
        break;
      case Range.obese_II:
        color = Colors.red[200];
        break;
      case Range.obese_III:
        color = Colors.red[300];
        break;
      default:
        color = Colors.black12;
    }

    return Text(
      '${bmi != null ? bmi : ''}',
      style: TextStyle(
        color: color,
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
