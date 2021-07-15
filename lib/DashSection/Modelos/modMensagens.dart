// class Mensagem {
//   String? remetente, conteudo, nomegrupo;
//   int? horario, lido, grupo;
//   //Construtor
//   Mensagem(String remetente, String conteudo, String nomegrupo, int horario,
//       int lido, int grupo) {
//     this.remetente = remetente;
//     this.conteudo = conteudo;
//     this.nomegrupo = nomegrupo;
//     this.horario = horario;
//     this.lido = lido;
//     this.grupo = grupo;
//   }
// }

// List listamensagens = [
//   Mensagem("Ana", "AAAAAA", "Grupo de Vendas", 1700, 0, 1),
//   Mensagem("Bob", "BBBBBB", "", 1700, 0, 0),
//   Mensagem("Carlos", "CCCCCC", "", 1700, 0, 0),
// ];

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../Constantes.dart';

class CartaoMensagens extends StatelessWidget {
  int? r, g, b;
  double? opacity;

  String? pessoa;
  int? qntmsg;
  //Construtor
  CartaoMensagens(
      int r, int g, int b, double opacity, String pessoa, int qntmsg) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.opacity = opacity;
    this.pessoa = pessoa;
    this.qntmsg = qntmsg;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                children: [
                  Icon(
                    Icons.brightness_1,
                    color: Color.fromRGBO(r!, g!, b!, opacity!),
                    size: 25,
                  ),
                  Text(
                    "    $pessoa",
                  ),
                ],
              ),
            ),
          ),
          Text("Total: $qntmsg")
        ],
      ),
    );
  }
}
