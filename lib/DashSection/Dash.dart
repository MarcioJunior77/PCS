import 'package:flutter/material.dart';
import 'package:pcs/DashSection/cardTarefas.dart';

import 'Constantes.dart';
import 'Cabecalho.dart';
import 'Responsividade.dart';
import 'Campos.dart';
import 'listaTarefas.dart';
import 'detalhesTarefas.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: defaultPadding),
                      TarefaNova(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) DetalhesTarefas(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: DetalhesTarefas(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
