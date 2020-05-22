import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String _text;
  final void Function() _restart;

  Result({
    @required String text,
    @required Function onRestart,
  })  : _text = text,
        _restart = onRestart;

  @override
  Widget build(BuildContext context) {
    var restultTextMessagem = Center(
      child: Text(
        _text,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );

    var restartButton = FlatButton(
      onPressed: _restart,
      child: Text('Reuniciar?'),
      textColor: Colors.blue,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[restultTextMessagem, restartButton],
    );
  }
}
