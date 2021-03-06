import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
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
  String userQuestion = "";
  String userAnswer = "";

  void buttonPressed(String value) {
    setState(() {
      userQuestion += value;
    });
  }

  bool operator (String x,){
    if(x == '%' || x == '/' || x == '-'|| x =='+' || x == 'x' || x == '=' || x == '-/+'|| x=='AC'|| x=='CE' ){
      return true;
    }
    return false;

  }


  void onEqualPressed(){

    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
  Row buildButton({String text1, String text2, String text3, String text4}) {
    return Row(
      children: <Widget>[
        FlatButton(
          color: operator(text1)? Colors.greenAccent: Colors.grey[900],
          onPressed: (){
            if((text1)== 'AC'){
              buttonPressed(userQuestion='');
              buttonPressed(userAnswer = '');
            }
            else{
              buttonPressed(text1);
            }
          },
          child: Text(
            '$text1',
            style: TextStyle(color: operator(text1)? Colors.white : Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),
        ),
        SizedBox(
          height: 80.0,
          width: 5.0,
        ),
        FlatButton(
          color: operator(text2)? Colors.blue[400] : Colors.grey[900],
          onPressed: () {
            buttonPressed(text2);
          },
          child: Text(
            '$text2',
            style: TextStyle(color: operator(text2)? Colors.white : Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),
        ),
        SizedBox(
          height: 80.0,
          width: 5.0,
        ),
        FlatButton(
          color: operator(text3)? Colors.pink[400] : Colors.grey[900],
          onPressed: () {
            buttonPressed(text3);
          },
          child: Text(
            '$text3',
            style: TextStyle(color: operator(text3)? Colors.white : Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),
        ),
        SizedBox(
          height: 80.0,
          width: 5.0,
        ),
        FlatButton(
          color: Colors.pink[400],
          onPressed: () {
            if(text4 == '='){
              setState(() {
                onEqualPressed();
              });
            }
            else {
              buttonPressed(text4);
            }
          },
          child: Text(
            '$text4',
            style: TextStyle(color: operator(text4)? Colors.white : Colors.blueGrey, fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),

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
                  userQuestion,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                userAnswer,
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
              buildButton(text1: 'AC', text2: 'CE', text3: '%', text4: '/'),
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
