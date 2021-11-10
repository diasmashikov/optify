import 'package:flutter/material.dart';
import 'package:optify/screens/main_screens/subscreens/account_screen.dart';
import 'package:optify/screens/main_screens/subscreens/groceries_screen.dart';
import 'package:optify/screens/main_screens/subscreens/home_screen.dart';
import 'package:optify/screens/main_screens/subscreens/meals_calendar_screen.dart';
import 'package:optify/screens/main_screens/subscreens/recipes_screen.dart';

import 'package:optify/singletons/singleton_bottom_navigation_screen.dart';
import 'package:optify/widgets/app_bars/account_app_bar.dart';
import 'package:optify/widgets/app_bars/groceries_app_bar.dart';
import 'package:optify/widgets/app_bars/home_app_bar.dart';
import 'package:optify/widgets/app_bars/meals_calendar_app_bar.dart';
import 'package:optify/widgets/app_bars/recipes_app_bar.dart';
import 'package:optify/widgets/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  final screens = [
    HomeScreen(),
    RecipesScreen(),
    MealsCalendarScreen(),
    GroceriesScreen(),
    AccountScreen()
  ];

  final appBars = [
    HomeAppBar(),
    RecipesAppBar(),
    MealsCalendarAppBar(),
    GroceriesAppBar(),
    AccountAppBar()
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: appBars[SingletonBottomNavigationScreen.index]
            as PreferredSizeWidget,
        bottomNavigationBar: CustomBottomNavigationBar(onItemTapped: () {
          setState(() {});
        }),
        body: IndexedStack(
          children: screens,
          index: SingletonBottomNavigationScreen.index,
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
