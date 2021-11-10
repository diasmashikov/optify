import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class GroceriesAppBar extends StatefulWidget implements PreferredSizeWidget {
  const GroceriesAppBar({Key? key}) : super(key: key);

  @override
  _GroceriesAppBarState createState() => _GroceriesAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _GroceriesAppBarState extends State<GroceriesAppBar>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      title: const Text(
        '',
        style: TextStyle(),
      ),
      actions: [
        TextButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(105, 0)),
                backgroundColor: MaterialStateProperty.all(WHITE_COLOR),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21.0)))),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.local_shipping_outlined,
                  color: DARK_COLOR,
                ),
                Text('Shop',
                    style: TextStyle(
                        color: DARK_COLOR,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
              ],
            )),
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
