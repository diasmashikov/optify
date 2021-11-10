import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/widgets/app_bars/home_app_bar.dart';
import 'package:optify/widgets/bottom_navigation_bar.dart';
import 'package:optify/widgets/bottom_navigation_widgets/active_icon.dart';
import 'package:optify/widgets/bottom_navigation_widgets/inactive_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Text(
                "Hello, Dias!",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: DARK_COLOR),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: 500,
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(211, 211, 211, 0.1),
                        Color.fromRGBO(245, 245, 245, 0.9),
                        Color.fromRGBO(211, 211, 211, 0.2),
                        Color.fromRGBO(245, 245, 245, 1),
                      ]),
                  borderRadius: BorderRadius.circular(21.0),
                  border: Border.all(
                      width: 0.1, color: Color.fromRGBO(248, 248, 255, 0.9))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("\$3.04",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(216, 146, 22, 1))),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Today's budget",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: DARK_COLOR),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2358 cal",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(216, 146, 22, 1)),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Today's calorie intake",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: DARK_COLOR),
                              ),
                            ],
                          )
                        ]),
                  ],
                ),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  border: Border.all(width: 1.0, color: WHITE_COLOR)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage('assets/images/breakfast1.jpg'),
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black.withOpacity(0.25),
                                Colors.black87.withOpacity(0.25),
                                Colors.black54.withOpacity(0.25),
                                Colors.black38.withOpacity(0.25),
                              ],
                              stops: [
                                0.1,
                                0.2,
                                0.4,
                                0.6
                              ]))),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromRGBO(34, 40, 49, 0.8),
                      ),
                      child: Center(
                        child: Text(
                          "Breakfast",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: WHITE_COLOR),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("English breakfast",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("867 cal, \$1.24",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("6:00-10:00 AM",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ))
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  border: Border.all(width: 1.0, color: WHITE_COLOR)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage('assets/images/lunch1.jpg'),
                      height: 300,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black.withOpacity(0.25),
                                Colors.black87.withOpacity(0.25),
                                Colors.black54.withOpacity(0.25),
                                Colors.black38.withOpacity(0.25),
                              ],
                              stops: [
                                0.1,
                                0.2,
                                0.4,
                                0.6
                              ]))),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromRGBO(34, 40, 49, 0.8),
                      ),
                      child: Center(
                        child: Text(
                          "Lunch",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: WHITE_COLOR),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sea ramen",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("837 cal, \$1.04",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("12:00-15:00 AM",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ))
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  border: Border.all(width: 1.0, color: WHITE_COLOR)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage('assets/images/dinner1.jpg'),
                      height: 300,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black.withOpacity(0.25),
                                Colors.black87.withOpacity(0.25),
                                Colors.black54.withOpacity(0.25),
                                Colors.black38.withOpacity(0.25),
                              ],
                              stops: [
                                0.1,
                                0.2,
                                0.4,
                                0.6
                              ]))),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromRGBO(34, 40, 49, 0.8),
                      ),
                      child: Center(
                        child: Text(
                          "Dinner",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: WHITE_COLOR),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mexican samsa",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("574 cal, \$0.84",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("18:00-20:00 AM",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
