import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'parser.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  
  var bmi;
  bool validate = false;
  bool state = false;
  double height = 0;
  double weight = 0;

  // static Calculator calculator = state ? ImperialCalculator() : MetricCalculator();
  // bmi = calculator.calculator(height, weight);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var background = Color(0xffffdde6);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI calculator',
        ),
        backgroundColor: Color(0xff2C5364),
      ),
      body: Container(
        color: background,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(25.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,            
            ),
            height: size.height * 0.6,
            // height: 460,
            width: 290,
              child: Column(
                children: <Widget>[
                  // Container for height
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Slide your height',
                          style: TextStyle(
                            color: Color(0xff0F2027),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('$height ' + (state ?  'ins' : 'cm')),
                        CupertinoSlider(
                          value: height,
                          onChanged: (double value) {
                            setState(() => height = value);
                          },
                          min: 0.0,
                          max: 250.0,
                          divisions: 500,
                          activeColor: Color(0xffb71540),
                          thumbColor: Color(0xffb71540),
                        ),       
                      ],
                    ),
                  ),
                  // Container for weight
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 35.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Slide your weight',
                          style: TextStyle(
                            color: Color(0xff0F2027),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('$weight ' + (state ? 'lbs' : 'kg')),
                        CupertinoSlider(
                          value: weight,
                          onChanged: (double value) {
                            setState(() => weight = value);
                          },
                          min: 0.0,
                          max: 150.0,
                          divisions: 300,
                          activeColor: Color(0xffb71540),
                          thumbColor: Color(0xffb71540),
                        ), 
                      ],
                    ),
                  ),
                  Text('Change to imperial units.'),
                  Switch(
                    value: state,
                    onChanged: (bool s) {
                      setState(() {
                        state = s;
                      });
                    },
                    activeColor: Color(0xffb71540),
                  ),
                  Text('Result: $bmi'),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: RaisedButton(
                      onPressed: () { 
                        if(heightController.text.isEmpty || weightController.text.isEmpty) {
                          setState(() { validate = true; }); 
                        } else {
                          setState(() {
                            validate = false;
                            final double height = parser(heightController.text);
                            final double weight = parser(weightController.text);
                            Calculator calculator = state ? ImperialCalculator() : MetricCalculator();
                            bmi = calculator.calculator(height, weight);
                          });
                        }
                      },
                      child: Text('Calculate'),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}