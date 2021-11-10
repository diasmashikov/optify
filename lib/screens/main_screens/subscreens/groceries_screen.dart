import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({Key? key}) : super(key: key);

  @override
  _GroceriesScreenState createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(children: [
          Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Text(
                "Groceries to buy",
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
              height: 100,
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
                              Row(
                                children: [
                                  Text("\$137.2",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromRGBO(216, 146, 22, 1))),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("\$294.04",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: GRAY_COLOR)),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Buying in bulk",
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
                              Text("52.7%",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(216, 146, 22, 1))),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "You save",
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
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    width: 500,
                    height: 80,
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
                            width: 0.1,
                            color: Color.fromRGBO(248, 248, 255, 0.9))),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24),
                        child: Row(
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: WHITE_COLOR,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                        width: 0.1,
                                        color: Color.fromRGBO(
                                            248, 248, 255, 0.9))),
                                child: Center(
                                  child: Text(
                                    "🍅",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tomato",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: DARK_COLOR),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "1 lbs",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: DARK_COLOR),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "\$20",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: PRIMARY_COLOR),
                            ),
                          ],
                        )));
              })
        ]));
  }
}
