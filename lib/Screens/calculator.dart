import 'package:project/constants/app_constants.dart';
import 'package:project/Widgets/left_bar.dart';
import 'package:project/Widgets/right_bar.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // --> BAGIAN APP-BAR
        title: Text(
          "Kalkulator IMT",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor, // --> IMPORT FROM PAKET CONSTANT
      body: SingleChildScrollView(
        // --> BAGIAN BODY
        child: Column(
          children: [
            // --> children column
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // --> children row
                Container(
                  // HEIGHT
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tinggi",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8))),
                  ),
                ),
                Container(
                  // WEIGHT
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Berat",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "Berat Badan Mu Berlebih ";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "Berat Badan Mu Normal";
                  } else {
                    _textResult = "Berat Badan Mu Kurang";
                  }
                });
              },
              child: Container(
                child: Text(
                  "HITUNG",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ), //Container
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Leftbar(barWidth: 40), // --> IMPORT FROM PAKET WIDGET
            SizedBox(
              height: 20,
            ),
            Leftbar(barWidth: 70), // --> IMPORT FROM PAKET WIDGET
            SizedBox(
              height: 20,
            ),
            Leftbar(barWidth: 40), // --> IMPORT FROM PAKET WIDGET
            SizedBox(
              height: 20,
            ),
            Rightbar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
            Rightbar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
