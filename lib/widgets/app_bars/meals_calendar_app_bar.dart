import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class MealsCalendarAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const MealsCalendarAppBar({Key? key}) : super(key: key);

  @override
  _MealsCalendarAppBarState createState() => _MealsCalendarAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _MealsCalendarAppBarState extends State<MealsCalendarAppBar>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      title: const Text(
        '',
        style: TextStyle(),
      ),
      actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13.0),
          child: Container(
            color: Colors.white,
            height: 35,
            width: 55,
            child: Icon(
              Icons.add,
              size: 20,
              color: DARK_COLOR,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
