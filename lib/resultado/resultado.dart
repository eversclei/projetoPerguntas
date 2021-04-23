import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function() reiniciarQuestionario;
  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao > 9 && pontuacao < 14) {
      return 'Você não odeia VF o suficiente, se esforce mais';
    } else if (pontuacao >= 14) {
      return 'Excelente, tu odeia muito VF.';
    } else {
      return 'Sério que tu gosta de VF, tu é um retardado';
    }
  }

  Widget build(BuildContext build) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          child: Text('Reiniciar teste'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
          onPressed: reiniciarQuestionario,
        )
      ],
    );
  }
}