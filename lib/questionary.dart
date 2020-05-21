import 'package:flutter/material.dart';
import 'package:projeto_perguntas/answer.dart';
import 'package:projeto_perguntas/question.dart';

class Questionary extends StatelessWidget {
  final List<String> _answers;
  final String _question;
  final Function() _onPressed;

  Questionary(this._question, this._answers, {Function() onPressed})
      : this._onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question: this._question),
        ..._answers
            .map((text) => Answer(text: text, onPressed: _onPressed))
            .toList()
      ],
    );
  }
}
