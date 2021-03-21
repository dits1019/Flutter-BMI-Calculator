import 'package:bmi_calculator/bmiPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '성별을 골라주세요',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 12,
            ),
            Hero(
              tag: 'maleIcon',
              child: IconButton(
                  iconSize: 200,
                  icon: FaIcon(FontAwesomeIcons.male),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Calculator(
                          gender: 'Male',
                          tagName: 'maleIcon',
                          genderIcon: FaIcon(
                            FontAwesomeIcons.male,
                            size: 70,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              'Male',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Hero(
              tag: 'FemaleIcon',
              child: IconButton(
                  iconSize: 200,
                  icon: FaIcon(FontAwesomeIcons.female),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Calculator(
                          tagName: 'FemaleIcon',
                          gender: 'Female',
                          genderIcon: FaIcon(
                            FontAwesomeIcons.female,
                            size: 70,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              'Female',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
