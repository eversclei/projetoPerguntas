import 'package:flutter/material.dart';
import './Questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPergutnaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPergutnaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((t) {
          return Resposta(
            t['texto'],
            () => responder(t['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
