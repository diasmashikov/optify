import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel>? sampleData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData!.add(new RadioModel(false, 'A', 'Lose weight'));
    sampleData!.add(new RadioModel(false, 'B', 'Maintain weight'));
    sampleData!.add(new RadioModel(false, 'C', 'Gain weight'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: sampleData!.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          //highlightColor: Colors.red,
          onTap: () {
            setState(() {
              sampleData!.forEach((element) => element.isSelected = false);
              sampleData![index].isSelected = true;
            });
          },
          child: new RadioItem(sampleData![index]),
        );
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 80,
      margin: new EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          gradient: _item.isSelected
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
          color: _item.isSelected ? SEMI_PRIMARY_COLOR : null,
          borderRadius: BorderRadius.circular(21.0),
          border: Border.all(
              width: 0.1, color: Color.fromRGBO(248, 248, 255, 0.9))),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: _item.isSelected ? PRIMARY_COLOR : WHITE_COLOR,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                    width: 0.1, color: Color.fromRGBO(248, 248, 255, 0.9))),
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(
              _item.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
