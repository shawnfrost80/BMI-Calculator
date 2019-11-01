import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Homestate();
  }
}


class Homestate extends State<Home> {

  final TextEditingController _age = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  String finalans = '';
  String con = '';

  void calc() {
    setState(() {
      var bmi = num.parse(_weight.text)/(num.parse(_height.text)*0.3048*
          num.parse(_height.text)*0.3048);
      finalans = 'Your BMI: ${bmi.toStringAsFixed(2)}';

      if (bmi < 18.5) {
        con = 'Underweight';
      } else if (bmi >= 18.5 && bmi <= 24.9){
        con = 'Normal';
      } else if (bmi > 24.9 && bmi <= 30) {
        con = 'Overweight';
      } else {
        con = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'images/111bmilogo.png',
              height: 100.0,
              width: 150.0,
            ),

            Container(
              color: Colors.grey.shade300,
              width: 500,
              height: 280,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'in Years',
                      labelText: 'Age',
                      icon: Icon(Icons.person),
                    ),
                  ),

                  TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'in Foots',
                      labelText: 'Height',
                      icon: Icon(Icons.show_chart),
                    ),
                  ),

                  TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'in Kg',
                      labelText: 'Weight',
                      icon: Icon(Icons.line_weight),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(13.0),),

                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: calc,
                      color: Colors.pink,
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )
                      )
                    )
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(10.0),),

            Center(
              child: Text(
                '$finalans',
                style: TextStyle(
                  fontSize: 23.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(5.0),),

            Center(
              child: Text(
                '$con',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.pink,
                  fontSize: 23.0,
                ),
              )
            )
          ],
        ),
      )
    );
  }
}