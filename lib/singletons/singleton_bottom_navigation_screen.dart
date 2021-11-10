import 'package:flutter/material.dart';

class SingletonBottomNavigationScreen {
  SingletonBottomNavigationScreen._privateConstructor();

  static final SingletonBottomNavigationScreen _instance =
      SingletonBottomNavigationScreen._privateConstructor();
  static int index = 0;
  factory SingletonBottomNavigationScreen() {
    return _instance;
  }
}
