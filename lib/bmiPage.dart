import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {
  const Calculator(
      {required this.gender,
      required this.genderIcon,
      required this.tagName});
  final String gender;
  final Widget genderIcon;
  final String tagName;

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final userHeight = TextEditingController();
  final userWeight = TextEditingController();
  String bmiResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: this.widget.tagName,
                  child: SizedBox(child: this.widget.genderIcon)),
              Text(
                this.widget.gender,
                style: TextStyle(fontSize: 35),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(17, 10, 17, 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: '키(단위 : m)'),
                  controller: userHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: '몸무게(단위 : kg)'),
                  controller: userWeight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        double height = double.parse(userHeight.text);
                        double weight = double.parse(userWeight.text);
                        var result = weight / (height * height);

                        if (result < 20.00)
                          bmiResult = "저체중";
                        else if (20.00 < result && result <= 24.99)
                          bmiResult = "정상";
                        else if (25.00 <= result && result <= 29.99)
                          bmiResult = "과체중";
                        else if (30.00 <= result) bmiResult = "비만";
                        print(result.toStringAsFixed(2));
                      });
                    },
                    child: Text('계산하기'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('뒤로가기'),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '결과 : $bmiResult',
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
