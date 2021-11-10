import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/singletons/singleton_bottom_navigation_screen.dart';

import 'bottom_navigation_widgets/active_icon.dart';
import 'bottom_navigation_widgets/inactive_icon.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ScreenCallback onItemTapped;
  const CustomBottomNavigationBar({Key? key, required this.onItemTapped})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: WHITE_COLOR_2,
            activeIcon: ActiveIcon(Icons.call),
            icon: InactiveIcon(Icons.call),
            label: 'Calls'),
        BottomNavigationBarItem(
          backgroundColor: WHITE_COLOR_2,
          activeIcon: ActiveIcon(Icons.camera),
          icon: InactiveIcon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          backgroundColor: WHITE_COLOR_2,
          activeIcon: ActiveIcon(Icons.chat),
          icon: InactiveIcon(Icons.chat),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
            backgroundColor: WHITE_COLOR_2,
            activeIcon: ActiveIcon(Icons.food_bank),
            icon: InactiveIcon(Icons.food_bank),
            label: 'Food'),
        BottomNavigationBarItem(
            backgroundColor: WHITE_COLOR,
            activeIcon: ActiveIcon(Icons.local_drink),
            icon: InactiveIcon(Icons.local_drink),
            label: 'Drinks'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      SingletonBottomNavigationScreen.index = selectedIndex;
      widget.onItemTapped();
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

typedef ScreenCallback = void Function();
