import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";

  void buttonPressed(String value) {
    setState(() {
      result += value;
    });
  }

  Row buildButton({String text1, String text2, String text3, String text4}) {
    return Row(
      children: <Widget>[
        FlatButton(
          onPressed: () => buttonPressed(text1),
          child: Text(
            '$text1',
            style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
          ),
        ),
        SizedBox(
          height: 80.0,
          width: 5.0,
        ),
        FlatButton(
          onPressed: () {
            buttonPressed(text2);
          },
          child: Text(
            '$text2',
            style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
          ),
        ),
        SizedBox(
          height: 80.0,
          width: 5.0,
        ),
        FlatButton(
          onPressed: () {
            buttonPressed(text3);
          },
          child: Text(
            '$text3',
            style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
          ),
        ),
        SizedBox(
          height: 80.0,
          width: 5.0,
        ),
        FlatButton(
          onPressed: () {
            buttonPressed(text4);
          },
          child: Text(
            '$text4',
            style: TextStyle(color: Colors.pink, fontSize: 20.0),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  result,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'hello',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 1.0,
              width: 325.0,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            children: <Widget>[
              buildButton(text1: 'C', text2: '+/-', text3: '%', text4: '/'),
              buildButton(text1: '7', text2: '8', text3: '9', text4: 'x'),
              buildButton(text1: '4', text2: '5', text3: '6', text4: '-'),
              buildButton(text1: '1', text2: '2', text3: '3', text4: '+'),
              buildButton(text1: '00', text2: '0', text3: '.', text4: '='),
            ],
          ),
        ],
      ),
    );
  }
}
