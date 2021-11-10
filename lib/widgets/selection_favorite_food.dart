import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/screens/secondary_screens/signing_screens/analysis_screen.dart';

class SelectionFavoriteFood extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  SelectionFavoriteFood(
      {required this.item, required this.isSelected, required this.key});

  @override
  _SelectionFavoriteFoodState createState() => _SelectionFavoriteFoodState();
}

class _SelectionFavoriteFoodState extends State<SelectionFavoriteFood> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(alignment: Alignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Image(
            color: isSelected ? DARK_COLOR : null,
            colorBlendMode: isSelected ? BlendMode.hardLight : null,
            image: AssetImage(widget.item.name),
            height: 220,
            width: 270,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: Container(
            width: 90,
            height: 30,
            decoration: isSelected
                ? null
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color.fromRGBO(34, 40, 49, 0.8),
                  ),
            child: Center(
              child: Text(
                "\$${widget.item.rank}",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: WHITE_COLOR),
              ),
            ),
          ),
        ),
        if (isSelected)
          Icon(
            Icons.check_circle_outline_outlined,
            color: WHITE_COLOR,
            size: 70,
          )
        else
          SizedBox.shrink(),
      ]),
    );
  }
}

/*
Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/breakfast1.jpg",
            color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
            colorBlendMode: BlendMode.color,
          ),
          isSelected
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    ),
                  ),
                )
              : Container()
        ],
      ),
      */
