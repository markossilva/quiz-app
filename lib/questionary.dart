import 'package:flutter/material.dart';
import 'package:projeto_perguntas/answer.dart';
import 'package:projeto_perguntas/question.dart';

class Questionary extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final int _questionsSelected;
  final void Function(int) _onPressed;

  Questionary({
    @required questions,
    @required int questionsSelected,
    @required void Function(int) onPressed,
  })  : this._questions = questions,
        this._questionsSelected = questionsSelected,
        this._onPressed = onPressed;

  bool get hasQuestionSelected {
    return _questionsSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestionSelected ? _questions[_questionsSelected]['answer'] : null;

    return Column(
      children: <Widget>[
        Question(
          question: _questions[_questionsSelected]['text'],
        ),
        ...answers
            .map((answer) => Answer(
                  text: answer['text'],
                  onPressed: () => _onPressed(answer['rating']),
                ))
            .toList()
      ],
    );
  }
}
