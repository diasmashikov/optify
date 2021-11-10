import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/screens/secondary_screens/signing_screens/analysis_screen.dart';

class RegistrationChoiceScreen extends StatelessWidget {
  const RegistrationChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0,
          title: new Text(""),
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ListView(children: [
              Text(
                "Sign up to Optify",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: DARK_COLOR),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 50,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(WHITE_COLOR_2),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(color: DARK_COLOR, width: 1),
                            borderRadius: BorderRadius.circular(28.0)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnalysisScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google_logo.png",
                              height: 30),
                          Spacer(),
                          Text('Continue with Google',
                              style: TextStyle(
                                  color: DARK_COLOR,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                        ],
                      ),
                    )),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: 50,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(WHITE_COLOR_2),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(color: DARK_COLOR, width: 1),
                            borderRadius: BorderRadius.circular(28.0)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrationChoiceScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            color: DARK_COLOR,
                            size: 30,
                          ),
                          Spacer(),
                          Text('Continue with email or phone',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: DARK_COLOR,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                        ],
                      ),
                    )),
              ),
            ])));
  }
}
