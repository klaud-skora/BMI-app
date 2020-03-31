import 'package:flutter/material.dart';
import 'calculator.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  final List<String> data = <String>['height', 'weight'];
  final List<String> units = <String>['cm', 'kg'];
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  var bmi = '';

   @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

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
            height: 420,
            width: 290,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Type your ${data[index]}',
                                  style: TextStyle(
                                    color: Color(0xff0F2027),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Flexible(
                                      child: SizedBox(
                                        width: 50, 
                                        child: TextField(controller: index == 0 ? heightController : weightController)
                                      ),
                                    ),
                                  ),
                                  Text(units[index]),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    )
                  ),
                  Container(
                    child: Text('Result: ')
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () => calculator(heightController.text, weightController.text),
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