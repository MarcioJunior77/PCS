import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'Modelos/modTarefas.dart';
import 'Constantes.dart';

class TarefaNova extends StatelessWidget {
  const TarefaNova({
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
            "Tarefas Recentes",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Nome"),
                ),
                DataColumn(
                  label: Text("Prazo"),
                ),
                DataColumn(
                  label: Text("Prioridade"),
                ),
              ],
              rows: List.generate(
                3,
                (index) => TarefaNovaDataRow(listatarefas[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow TarefaNovaDataRow(Tarefa info) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(info.nome!),
            ),
          ],
        ),
      ),
      DataCell(Text(info.fim!)),
      DataCell(Text(info.prioridade!)),
    ],
  );
}
