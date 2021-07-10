import 'package:flutter/material.dart';

import 'Constantes.dart';
import 'Grafico.dart';
import 'Modelos/modCartao.dart';

class DetalhesTarefas extends StatelessWidget {
  const DetalhesTarefas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "Detalhes das Tarefas",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          CartaoTarefas("Alta", 5, 10),
          CartaoTarefas("Média", 1, 20),
          CartaoTarefas("Baixa", 8, 8),
        ],
      ),
    );
  }
}
