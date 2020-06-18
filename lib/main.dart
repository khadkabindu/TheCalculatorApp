import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Row buildButton ( {String text1,String text2, String text3, String text4}){
    return Row(
      children: <Widget>[
        FlatButton(
          onPressed: (){},
          child: Text('${text1}' ,style: TextStyle(color: Colors.white,fontSize: 20.0),),
        ),
        SizedBox(height: 80.0,),
        FlatButton(
          onPressed: (){},
          child: Text('${text2}',style: TextStyle(color: Colors.white,fontSize: 20.0),),
        ),
        SizedBox(height: 80.0,),
        FlatButton(
          onPressed: (){},
          child: Text('${text3}',style: TextStyle(color: Colors.white,fontSize: 20.0),),

        ),
        SizedBox(height: 80.0,),
        FlatButton(
          onPressed: (){},
          child: Text('${text4}',style: TextStyle(color: Colors.white,fontSize: 20.0),),

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
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 210,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 1.0,
              width: 400.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.0,),
          Column(
            children: <Widget>[
              buildButton(text1 :'C', text2:'+/-', text3: '%', text4:'/'),
              buildButton(text1: '7',text2: '8',text3: '9', text4: 'x'),
              buildButton(text1: '4',text2: '5',text3: '6',text4: '-'),
              buildButton(text1: '1',text2: '2',text3: '3',text4: '4'),
              buildButton(text1: '00',text2: '0',text3: '.',text4: '='),

            ],
          ),
        ],
      ),
    );
  }
}
