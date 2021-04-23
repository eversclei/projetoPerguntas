import 'package:flutter/material.dart';
import './perguntaAppStateful.dart';
import '../resultado/resultado.dart';
import './questionario.dart';

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 4},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Azul', 'pontuacao': 2},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 4},
        {'texto': 'Cobra', 'pontuacao': 2},
        {'texto': 'Elefante', 'pontuacao': 1},
        {'texto': 'Leão', 'pontuacao': 3},
      ]
    },
    {
      'texto': 'Qual o filme que você mais odeia?',
      'respostas': [
        {'texto': 'Velozes e Furiosos 1', 'pontuacao': 1},
        {'texto': 'Velozes e Furiosos 2', 'pontuacao': 2},
        {'texto': 'Velozes e Furiosos 3', 'pontuacao': 3},
        {'texto': 'Velozes e Furiosos 4', 'pontuacao': 4},
        {'texto': 'Velozes e Furiosos 5', 'pontuacao': 5},
        {'texto': 'Velozes e Furiosos 6', 'pontuacao': 6},
        {'texto': 'Velozes e Furiosos 7', 'pontuacao': 7},
        {'texto': 'Velozes e Furiosos 8', 'pontuacao': 8},
      ]
    }
  ];

  bool get temPergutnaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder(int pontuacaoTotal) {
    if (temPergutnaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacaoTotal;
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPergutnaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
