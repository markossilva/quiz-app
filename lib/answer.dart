import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  void Function() onLongPress;

  Answer({this.text, this.onPressed, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.text),
        onPressed: this.onPressed,
        onLongPress: this.onLongPress,
      ),
    );
  }
}
