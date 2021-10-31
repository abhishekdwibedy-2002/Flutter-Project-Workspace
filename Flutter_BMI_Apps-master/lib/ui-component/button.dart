import 'dart:math';
import 'package:validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/ui-component/text.dart';
import 'package:flutter_bmi_app/home.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

List<String> lis = [
  'images/greatbody.jpg',
  'images/noresult.png',
  'images/Obese.png',
  'images/Overweight.png',
  'images/underweight.png'
];

int k;
String mess = '';

//variables for calc
void getVal() {
  contLis contobj = new contLis();
  //String mess = ",BMI: ";
  double bmi, bm;
  double h, a, w;
  if ((contobj.ac.text.isEmpty ||
          contobj.hc.text.isEmpty ||
          contobj.wc.text.isEmpty) ||
      !(isNumeric(contobj.ac.text) &&
          isNumeric(contobj.hc.text) &&
          isNumeric(contobj.wc.text))) {
    mess = "That's Meaningless!!";
    k = 1;
  } else {
    h = int.parse(contobj.hc.text) / 100;
    a = double.parse(contobj.ac.text);
    w = double.parse(contobj.wc.text);
    bm = w / pow(h, 2);
    bmi = double.parse(bm.toStringAsFixed(2));
    if (bmi < 18.5) {
      mess = 'Underweight: ' + (bmi).toString();
      k = 4;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      mess = 'Normal Weight: ' + (bmi).toString();
      k = 0;
    } else if (bmi >= 24.9 && bmi < 29.9) {
      mess = 'Overweight: ' + (bmi).toString();
      k = 3;
    } else if (bmi >= 30) {
      mess = 'Obese: ' + (bmi).toString();
      k = 2;
    }
  }
}
//end cal

class _ButtonState extends State<Button> {
  ShowDialog(BuildContext context) {
    getVal();
    Dialog dialog = Dialog(
      backgroundColor: Colors.white,
      child: Container(
        //color: Colors.lightBlueAccent,
        width: 20.0,
        height: 280.0,
        child: Column(
          children: [
            Container(
              width: 240.0,
              height: 30.0,
              alignment: Alignment.center,
              color: Colors.pinkAccent,
              child: Text(
                'BMI result',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Image(
                image: AssetImage(lis[k]),
                width: 150.0,
                height: 150.0,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
              child: Text(
                mess,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OKay"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => ShowDialog(context),
      child: TextComponent(),
      color: Colors.pink.shade400,
    );
  }
}
