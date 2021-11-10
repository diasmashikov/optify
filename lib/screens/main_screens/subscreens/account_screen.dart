import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 4,
              ),
              Text(
                "Account",
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
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(211, 211, 211, 0.1),
                            Color.fromRGBO(245, 245, 245, 0.6),
                            Color.fromRGBO(211, 211, 211, 0.2),
                            Color.fromRGBO(245, 245, 245, 1),
                          ]),
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(
                          width: 0.1,
                          color: Color.fromRGBO(248, 248, 255, 0.9))),
                ),
                backgroundColor: PRIMARY_COLOR,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dias Mashikov",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Subscribed",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: GRAY_COLOR),
                  ),
                ],
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
                  color: PRIMARY_COLOR,
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
                              Text("\$137.04",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(216, 146, 22, 1))),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Total budget",
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
                          ),
                        ]),
                  ],
                ),
              )),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 125 / 125,
            children: [
              _buildStatisticsContainer("maintain the weight", "Fitness mode"),
              _buildStatisticsContainer("100 grams", "Protein"),
              _buildStatisticsContainer("250 grams", "Carbs"),
              _buildStatisticsContainer("Seattle", "City")
            ],
          ),
        ]));
  }

  Widget _buildStatisticsContainer(String content, String title) {
    return Container(
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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(content,
                        style: TextStyle(
                            fontSize: (500 + 150) / (28 + content.length),
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(216, 146, 22, 1))),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: DARK_COLOR),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ));
  }
}
