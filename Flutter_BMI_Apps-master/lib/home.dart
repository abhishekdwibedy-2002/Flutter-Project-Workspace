import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/ui-component/button.dart';
import 'package:flutter_bmi_app/ui-component/text.dart';
import 'package:flutter_bmi_app/ui-component/texteditorcpmponent.dart';

class BmiHomePage extends StatefulWidget {
  @override
  _BmiHomePageState createState() => _BmiHomePageState();
}
final TextEditingController ac = new TextEditingController();
final TextEditingController hc = new TextEditingController();
final TextEditingController wc = new TextEditingController();


class _BmiHomePageState extends State<BmiHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: new AppBar(
        title: Text("B M I"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(30, 30, 20, 0),
                color: Colors.white,
                height: 57.0,
                width: 260.0,
                //padding: EdgeInsets.fromLTRB(70, 20, 20, 0),
                child: Image(
                  image: AssetImage('images/bmilogo.png'),
                  width: 75.0,
                  height: 85.0,
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                height: 80.0,
                width: 259.0,
                child: TextEditor('AGE', 'EG:-67', Icons.person,ac),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                height: 80.0,
                width: 259.0,
                child: TextEditor(
                    'HEIGHT (in cm)', 'EG:-150', Icons.accessibility,hc),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                height: 80.0,
                width: 259.0,
                child: TextEditor(
                    'WEIGHT (in kgs)', 'EG:-89', Icons.fitness_center,wc),
              ),
              Container(
                child: Button(),
                //color: Colors.white,
                width: 150.0,
                margin: EdgeInsets.fromLTRB(40, 20, 20, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<TextEditingController> contlis =[ac,hc,wc];
class contLis{
  TextEditingController ac = contlis[0];
  TextEditingController hc = contlis[1];
  TextEditingController wc = contlis[2];

}