import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionary.dart';
import 'package:projeto_perguntas/result.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  final _questions = const [
    {
      'text': 'Qual sua cor favorita?',
      'answer': ['Vermelho', 'Laranjado', 'Azul'],
    },
    {
      'text': 'Qual seu animal preferido?',
      'answer': ['Cachorro', 'Gato', 'Hamster'],
    },
    {
      'text': 'Qual sua comida preferida?',
      'answer': ['strogonoff de frango', 'Lasanha', 'Cuzcuz'],
    }
  ];

  bool get _hasSelectedQuestion {
    return _perguntaSelecionada < _questions.length;
  }

  void _responder() {
    if (_hasSelectedQuestion) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  Widget _buildAppBar(String title) {
    return AppBar(title: Text(title));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar('Perguntas'),
        body: _hasSelectedQuestion
            ? Questionary(
                _questions[_perguntaSelecionada]['text'],
                _hasSelectedQuestion
                    ? _questions[_perguntaSelecionada]['answer']
                    : null,
                onPressed: _responder,
              )
            : Result('Parabéns!'),
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
