import 'package:flutter/material.dart';
import '../Constantes.dart';

class CartaoTarefas extends StatelessWidget {
  String? prioridade;
  int? feitos, total;
  //Construtor
  CartaoTarefas(String prioridade, int feitos, int total) {
    this.prioridade = prioridade;
    this.feitos = feitos;
    this.total = total;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$prioridade",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$feitos Tarefas Finalizadas",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text("Total: $total")
        ],
      ),
    );
  }
}
