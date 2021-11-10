import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late int currentTabIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Text(
                "Recipes",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: DARK_COLOR),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DefaultTabController(
            length: 3,
            child: StatefulBuilder(builder: (context, setState) {
              return TabBar(
                  controller: _tabController,
                  onTap: (index) {
                    currentTabIndex = index;
                  },
                  unselectedLabelColor: GRAY_COLOR,
                  labelColor: WHITE_COLOR,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      21.0,
                    ),
                    color: PRIMARY_COLOR,
                  ),
                  tabs: [
                    Tab(
                        child: Center(
                      child: Text(
                        "Breakfast",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                    Tab(
                        child: Center(
                      child: Text(
                        "Lunch",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                    Tab(
                        child: Center(
                      child: Text(
                        "Break",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
                  ]);
            }),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              buildListRecipes(),
              buildListRecipes(),
              buildListRecipes(),
            ]),
          ),
        ]));
  }

  Widget buildListRecipes() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
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
                    height: 200,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    height: 200,
                    width: 400,
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
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color.fromRGBO(19, 217, 112, 1),
                    ),
                    child: Center(
                      child: Text(
                        "Easy",
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
                                fontSize: 20,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("867 cal, \$1.24",
                            style: TextStyle(
                                fontSize: 16,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 8,
                        ),
                        Text("15 minutes",
                            style: TextStyle(
                                fontSize: 16,
                                color: WHITE_COLOR,
                                fontWeight: FontWeight.bold)),
                      ],
                    ))
              ],
            ));
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
