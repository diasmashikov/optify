import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/screens/secondary_screens/signing_screens/analysis_screen.dart';

class SelectionItem extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  SelectionItem(
      {required this.item, required this.isSelected, required this.key});

  @override
  _SelectionItemState createState() => _SelectionItemState();
}

class _SelectionItemState extends State<SelectionItem> {
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
        child: Container(
          height: 80,
          margin: new EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              gradient: isSelected
                  ? null
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                          Color.fromRGBO(211, 211, 211, 0.1),
                          Color.fromRGBO(245, 245, 245, 0.9),
                          Color.fromRGBO(211, 211, 211, 0.2),
                          Color.fromRGBO(245, 245, 245, 1),
                        ]),
              color: isSelected ? SEMI_PRIMARY_COLOR : null,
              borderRadius: BorderRadius.circular(21.0),
              border: Border.all(
                  width: 0.2, color: Color.fromRGBO(248, 248, 255, 0.9))),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Container(
                height: 50.0,
                width: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    color: isSelected ? PRIMARY_COLOR : WHITE_COLOR,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                        width: 0.1, color: Color.fromRGBO(248, 248, 255, 0.9))),
                child: new Center(
                  child: new Text(widget.item.rank.toString(),
                      style: new TextStyle(
                          color: isSelected ? WHITE_COLOR : DARK_COLOR,
                          //fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
                ),
              ),
              new Container(
                margin: new EdgeInsets.only(left: 10.0),
                child: new Text(
                  widget.item.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
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
