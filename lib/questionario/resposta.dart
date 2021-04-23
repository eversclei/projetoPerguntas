import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        child: Text(texto),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
