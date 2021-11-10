import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class ActiveIcon extends StatelessWidget {
  final IconData icon;
  const ActiveIcon(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.0),
      child: Container(
        height: 40,
        width: 40,
        color: DARK_COLOR,
        child: Icon(
          icon,
          size: 20,
          color: WHITE_COLOR,
        ),
      ),
    );
  }
}
