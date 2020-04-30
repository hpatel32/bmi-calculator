import 'package:flutter/material.dart';
import 'Input_State.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: Color(0xFF3C3C46),
      ),
      home: InputPage(),
    );
  }
}
