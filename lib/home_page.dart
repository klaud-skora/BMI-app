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
  dynamic bmi = '';
  bool validate = false;

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
                                        child: TextField(
                                          controller: index == 0 ? heightController : weightController,
                                          decoration: InputDecoration(
                                            errorText: validate && ((index == 0 ? heightController : weightController).text == '') ? 'Empty' : null,
                                          ),
                                        )
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
                    child: Text('Result: $bmi')
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: RaisedButton(
                      onPressed: () {
                        if(heightController.text.isEmpty || weightController.text.isEmpty) {
                          setState(() {
                            validate = true;
                          }); 
                        } else {
                          setState(() {
                            validate = false;
                            bmi = calculator(heightController.text, weightController.text);
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