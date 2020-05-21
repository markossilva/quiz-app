import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  Question({this.question});

  Widget _questionText() {
    return Text(
      question,
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: _questionText(),
    );
  }
}
