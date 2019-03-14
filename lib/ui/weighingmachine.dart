import 'package:flutter/material.dart';

class WeightingMachine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeightingMachineState();
  }
}

class WeightingMachineState extends State<WeightingMachine> {
// Mercury: 0.38
// Venus: 0.91
// Earth: 1.00
// Mars: 0.38
// Jupiter: 2.34
// Saturn: 1.06
// Uranus: 0.92
// Neptune: 1.19
// Pluto: 0.06

  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = '';
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your weight on Pluto is $_finalResult";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your weight on Mars is $_finalResult";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your weight on Venus is $_finalResult";
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Weighting Machine"),
        backgroundColor: Colors.black38,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Image.asset("images/logo.png", width: 100, height: 100),
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Your Weight on Earth",
                        hintText: "In Pounds",
                        icon: Icon(Icons.person)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.deepOrange,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text("Pluto", style: TextStyle(color: Colors.white54)),
                      Radio<int>(
                        activeColor: Colors.deepOrange,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text("Mars", style: TextStyle(color: Colors.white54)),
                      Radio<int>(
                        activeColor: Colors.deepOrange,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text("Venus", style: TextStyle(color: Colors.white54)),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Text(
              _weightController.text == "" || _weightController.text == null ?"Please Enter Some Weight":_formattedText,
              style: TextStyle(color: Colors.white70, fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return double.parse((int.parse(weight) * multiplier).toStringAsFixed(2));
    } else {
      print("Wrong");
      return int.parse("180") * 0.38;
    }
  }
}
