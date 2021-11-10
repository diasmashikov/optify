import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class AccountAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AccountAppBar({Key? key}) : super(key: key);

  @override
  _AccountAppBarState createState() => _AccountAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _AccountAppBarState extends State<AccountAppBar>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.980),
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
              Icons.settings,
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
