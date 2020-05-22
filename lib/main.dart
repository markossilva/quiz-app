import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionary.dart';
import 'package:projeto_perguntas/result.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _questionSelected = 0;
  int _totalRating = 0;
  final _questions = const [
    {
      'text': 'Qual sua cor favorita?',
      'answer': [
        {'text': 'Vermelho', 'rating': 1},
        {'text': 'Laranjado', 'rating': 2},
        {'text': 'Azul', 'rating': 3},
      ],
    },
    {
      'text': 'Qual seu animal preferido?',
      'answer': [
        {'text': 'Cachorro', 'rating': 1},
        {'text': 'Gato', 'rating': 2},
        {'text': 'Hamster', 'rating': 3}
      ],
    },
    {
      'text': 'Qual sua comida preferida?',
      'answer': [
        {'text': 'strogonoff de frango', 'rating': 1},
        {'text': 'Lasanha', 'rating': 2},
        {'text': 'Cuzcuz', 'rating': 3}
      ],
    }
  ];

  bool get _hasSelectedQuestion {
    return _questionSelected < _questions.length;
  }

  void _responder(int rating) {
    if (_hasSelectedQuestion) {
      setState(() {
        _questionSelected++;
        _totalRating += rating;
      });
    }
  }

  void restartQuestionary() {
    setState(() {
      _questionSelected = 0;
      _totalRating = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(title: Text('Perguntas'));

    var questionary = Questionary(
      questions: _questions,
      questionsSelected: _questionSelected,
      onPressed: _responder,
    );

    var result = Result(
      text: 'Parabéns! Total: $_totalRating pontos',
      onRestart: restartQuestionary,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: _hasSelectedQuestion ? questionary : result,
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
