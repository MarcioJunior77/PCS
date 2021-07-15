import 'package:flutter/material.dart';

import 'Constantes.dart';
import 'Modelos/modMensagens.dart';
import 'graficoMensagens.dart';
import 'package:pcs/globals.dart' as globals;

class DetalhesMensagens extends StatelessWidget {
  const DetalhesMensagens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var num1 = globals.counter;
    double num2 = 20;
    double num3 = 10;
    double num4 = 30;
    double num5 = 0;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detalhes das Mensagens",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          ChartMensagens(),
          CartaoMensagens(62, 206, 206, 1, "Marcio", num1.toInt()),
          CartaoMensagens(38, 229, 255, 1, "Nathan", num2.toInt()),
          CartaoMensagens(255, 207, 38, 1, "Italo", num3.toInt()),
          CartaoMensagens(238, 39, 39, 1, "Tiago", num4.toInt()),
        ],
      ),
    );
  }
}
