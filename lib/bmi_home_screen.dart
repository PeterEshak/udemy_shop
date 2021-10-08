import 'modules/bmi_app/bmi/bmi_screen.dart';
import 'package:flutter/material.dart';

// void main() => runApp(const BMIHomeScreen());

class BMIHomeScreen extends StatelessWidget {
  const BMIHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}
