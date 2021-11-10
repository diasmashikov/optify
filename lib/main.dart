import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/screens/secondary_screens/signing_screens/analysis_screen.dart';

import 'package:optify/screens/main_screens/main_screen.dart';
import 'package:optify/screens/secondary_screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 0.980)),
      home: WelcomeScreen(),
    );
  }
}
