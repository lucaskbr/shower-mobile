import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shower/models/ranking.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String title;
  Function onPress;
  Color backgroundColor;


  Button({this.title, this.onPress, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 45,
      child: RaisedButton(
        color: backgroundColor != null ? backgroundColor : Colors.cyan[800],
        textColor: Colors.white,
        child: Text(title),
        onPressed: () => onPress()
      ),
    );
  }
}
