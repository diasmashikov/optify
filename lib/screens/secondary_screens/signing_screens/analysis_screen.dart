import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/screens/main_screens/main_screen.dart';
import 'package:optify/screens/main_screens/subscreens/recipes_screen.dart';
import 'package:optify/widgets/radio_group.dart';
import 'package:optify/widgets/selection_diet.dart';
import 'package:optify/widgets/selection_favorite_food.dart';

import 'analysis_subscreens/generated_recipes_screen.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  List<Item> itemList = [
    Item("Vegetables", 1),
    Item("Meat", 2),
    Item("Vegetables", 3)
  ];

  List<Item> favoriteFoodList = [
    Item("assets/images/breakfast1.jpg", 3),
    Item("assets/images/lunch1.jpg", 6),
  ];

  List<Item> selectedList = [];
  String _quantity = "1";
  int currentPageIndex = 1;
  String selectedFitnessGoal = "Loose";
  final PageController controller = PageController(initialPage: 0);
  Future<bool> _onWillPop() async {
    if (currentPageIndex > 1) {
      controller.previousPage(
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: currentPageIndex != 1 ? _onWillPop : null,
      child: Scaffold(
        floatingActionButton: currentPageIndex == 8
            ? Container(
                width: 150,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    controller.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  },
                  label: Text(
                    'Continue',
                    style: TextStyle(color: WHITE_COLOR),
                  ),
                  backgroundColor: DARK_COLOR,
                ),
              )
            : null,
        appBar: new AppBar(
          elevation: 0,
          title: new Text(""),
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2.0),
            child: LinearProgressIndicator(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
              valueColor: new AlwaysStoppedAnimation<Color>(DARK_COLOR),
              value: currentPageIndex.toDouble() / 10,
            ),
          ),
        ),
        body: PageView(
          scrollBehavior: null,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index + 1;
            });
          },

          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          /// controller.nextPage(
          //duration: Duration(milliseconds: 800),
          //curve: Curves.easeIn);
          scrollDirection: Axis.horizontal,
          controller: controller,
          //physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            // 1
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "Let's get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "What is your email?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: DARK_COLOR),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: GRAY_COLOR,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(211, 211, 211, 0.9),
                            Color.fromRGBO(211, 211, 211, 0.9),
                          ]),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: DARK_COLOR),
                        minLines: 1,

                        maxLines: 50,
                        enabled: true,
                        controller: TextEditingController(),
                        cursorColor: DARK_COLOR,
                        enableSuggestions: false,

                        validator: (value) {
                          if (value == 0)
                            return "Заполните поле";
                          else
                            return null;
                        },

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        //obscureText: true,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 2
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "What is your height?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: GRAY_COLOR,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(211, 211, 211, 0.9),
                            Color.fromRGBO(211, 211, 211, 0.9),
                          ]),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: DARK_COLOR),
                        minLines: 1,

                        maxLines: 50,
                        enabled: true,
                        controller: TextEditingController(),
                        cursorColor: DARK_COLOR,
                        enableSuggestions: false,

                        validator: (value) {
                          if (value == 0)
                            return "Заполните поле";
                          else
                            return null;
                        },

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Height(cm/feet)',
                        ),
                        //obscureText: true,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 3
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "What is your mass?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: GRAY_COLOR,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(211, 211, 211, 0.9),
                            Color.fromRGBO(211, 211, 211, 0.9),
                          ]),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: DARK_COLOR),
                        minLines: 1,

                        maxLines: 50,
                        enabled: true,
                        controller: TextEditingController(),
                        cursorColor: DARK_COLOR,
                        enableSuggestions: false,

                        validator: (value) {
                          if (value == 0)
                            return "Заполните поле";
                          else
                            return null;
                        },

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mass(kg/lbs)',
                        ),
                        //obscureText: true,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 4
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "What is your fitness goal?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  CustomRadio(),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 5
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "What is your monthly budget?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: GRAY_COLOR,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(211, 211, 211, 0.9),
                            Color.fromRGBO(211, 211, 211, 0.9),
                          ]),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: DARK_COLOR),
                        minLines: 1,

                        maxLines: 50,
                        enabled: true,
                        controller: TextEditingController(),
                        cursorColor: DARK_COLOR,
                        enableSuggestions: false,

                        validator: (value) {
                          if (value == 0)
                            return "Заполните поле";
                          else
                            return null;
                        },

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '\$\$\$',
                        ),
                        //obscureText: true,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 6
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "Do you have a specific diet?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        return SelectionItem(
                            item: itemList[index],
                            isSelected: (bool value) {
                              setState(() {
                                if (value) {
                                  selectedList.add(itemList[index]);
                                } else {
                                  selectedList.remove(itemList[index]);
                                }
                              });
                              print("$index : $value");
                            },
                            key: Key(itemList[index].rank.toString()));
                      }),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 7
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "Choose the one that you like more",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 30,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: favoriteFoodList.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: SelectionFavoriteFood(
                              item: favoriteFoodList[index],
                              isSelected: (bool value) {
                                setState(() {
                                  if (value) {
                                    selectedList.add(favoriteFoodList[index]);
                                  } else {
                                    selectedList
                                        .remove(favoriteFoodList[index]);
                                  }
                                });
                                print("$index : $value");
                              },
                              key:
                                  Key(favoriteFoodList[index].rank.toString())),
                        );
                      }),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 8
            GeneratedRecipesScreen(),
            // 9
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "You are all set",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 125 / 125,
                    children: [
                      _buildStatisticsContainer("\$200", "Monthly budget"),
                      _buildStatisticsContainer("\$2387", "Daily calories"),
                      _buildStatisticsContainer(
                          "Maintain the weight", "Fitness mode"),
                      _buildStatisticsContainer("250 grams", "Daily carbs"),
                      _buildStatisticsContainer("100 grams", "Daily protein"),
                      _buildStatisticsContainer("20", "Total recipes"),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
            // 10
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                //shrinkWrap: true,
                children: [
                  Text(
                    "Save money and time with our groceries purchase and containment system",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                  Spacer(),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 20,
                    children: [
                      _groceryPurchaseAndContainmentSystemBlocks("1",
                          "Groceries purchase is done in bulk on the app."),
                      _groceryPurchaseAndContainmentSystemBlocks("2",
                          "By buying groceries in bulk we save on average 60% of our budget"),
                      _groceryPurchaseAndContainmentSystemBlocks("3",
                          "Containment of food in bulk is easy and instructions are on the app"),
                      _groceryPurchaseAndContainmentSystemBlocks("4",
                          "All of it saves you around 70% of time on groceries purchases and cooking overall"),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(DARK_COLOR),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28.0)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MainScreen()));
                        },
                        child: Text('Finish',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _groceryPurchaseAndContainmentSystemBlocks(
      String numeration, String instruction) {
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
                width: 0.1, color: Color.fromRGBO(248, 248, 255, 0.9))),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
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
                            color: Color.fromRGBO(248, 248, 255, 0.9))),
                    child: Center(
                      child: Text(
                        numeration,
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Text(
                    instruction,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: DARK_COLOR),
                  ),
                ),
              ],
            )));
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

class Item {
  String name;
  int rank;
  Item(this.name, this.rank);
}
