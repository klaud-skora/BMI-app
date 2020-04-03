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

  @override
  Widget build(BuildContext context) {
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
                          'Type your height',
                          style: TextStyle(
                            color: Color(0xff0F2027),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(                          
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                width: 50, 
                                child: TextField(
                                  controller: heightController,
                                  decoration: InputDecoration(
                                    errorText: validate && heightController.text.isEmpty ? 'Empty' : null,
                                  ),
                                )
                              ),
                            ),
                            Text(state ?  'ins' : 'cm'),
                          ],
                        )
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
                          'Type your weight',
                          style: TextStyle(
                            color: Color(0xff0F2027),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                width: 50, 
                                child: TextField(
                                  controller: weightController,
                                  decoration: InputDecoration(
                                    errorText: validate && weightController.text.isEmpty ? 'Empty' : null,
                                  ),
                                )
                              ),
                            ),
                            Text(state ? 'lbs' : 'kg'),
                          ],
                        )
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
                  ),
                  Text('Result: ${bmi != null ? bmi : ''}'),
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