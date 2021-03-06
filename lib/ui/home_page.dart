import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../logic/calculator.dart';
import 'type_extension.dart';
import 'bmi_indicator.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  bool switchOn = false;
  double height = 0;
  double weight = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var background = Color(0xffffdde6);
    Calculator calculator = switchOn ? ImperialCalculator() : MetricCalculator();
    double bmi = calculator.calculator(height, weight);
    Range range = getBMI(bmi);
    print(bmi);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI calculator'),
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
            width: size.width * 0.8,
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
                        SizedBox(height: 10.0),
                        Text('$height ' + (switchOn ?  'ins' : 'cm')),
                        CupertinoSlider(
                          value: height,
                          onChanged: (double value) {
                            setState(() => height = (value * 100).round() / 100);
                          },
                          min: 0.0,
                          max: switchOn ? 100.0 : 250.0,
                          divisions: switchOn ? 400 : 500,
                          activeColor: Color(0xffb71540),
                          thumbColor: Color(0xffb71540),
                        ),
                      ],
                    ),
                  ),
                  // Container for weight
                  Container(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Slide your weight',
                          style: TextStyle(
                            color: Color(0xff0F2027),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text('$weight ' + (switchOn ? 'lbs' : 'kg')),
                        CupertinoSlider(
                          value: weight,
                          onChanged: (double value) {
                            setState(() => weight = (value * 100).round() / 100);
                          },
                          min: 0.0,
                          max: switchOn ? 300.0 : 150.0,
                          divisions: switchOn ? 1200 : 300,
                          activeColor: Color(0xffb71540),
                          thumbColor: Color(0xffb71540),
                        ), 
                      ],
                    ),
                  ),
                  Text('Change to imperial units.'),
                  Switch(
                    value: switchOn,
                    onChanged: (bool state) {
                      setState(() { 
                        switchOn = state;
                        height = 0;
                        weight = 0; 
                      });
                    },
                    activeColor: Color(0xffb71540),
                  ),
                  BmiIndicator(bmi: bmi),
                  SizedBox(height: 10.0),
                  Text('${range.type}'),
                ],
              ),
            )
        ),
      ),
    );
  }
}