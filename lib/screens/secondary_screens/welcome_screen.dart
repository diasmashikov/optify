import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/screens/secondary_screens/signing_screens/analysis_screen.dart';
import 'package:optify/screens/secondary_screens/signing_screens/registration_choice_screen.dart';

import 'signing_screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(211, 211, 211, 0.8),
                        Color.fromRGBO(245, 245, 245, 0.9),
                        Color.fromRGBO(211, 211, 211, 0.8),
                        Color.fromRGBO(245, 245, 245, 1),
                      ]),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                      width: 0.1, color: Color.fromRGBO(248, 248, 255, 0.9))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    image: AssetImage('assets/images/welcome_screen_food.jpg'),
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Automize meal plans with smart budgeting",
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: DARK_COLOR),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 200,
              height: 50,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(DARK_COLOR),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0)))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegistrationChoiceScreen()));
                  },
                  child: Text('Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 16.0))),
            ),
            SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Log In',
                    style: TextStyle(color: DARK_COLOR, fontSize: 16.0))),
          ],
        ),
      ),
    );
  }
}
