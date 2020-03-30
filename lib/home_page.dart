import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
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
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Type your height',
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
                                  child: TextField()
                                ),
                              ),
                            ),
                            Text('cm'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Type your weight',
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
                                  child: TextField()
                                ),
                              ),
                            ),
                            Text('kg'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}