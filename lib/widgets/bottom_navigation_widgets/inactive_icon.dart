import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class InactiveIcon extends StatelessWidget {
  final IconData icon;
  const InactiveIcon(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 25,
      color: GRAY_COLOR,
    );
  }
}
