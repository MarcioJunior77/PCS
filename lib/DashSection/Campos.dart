import 'package:flutter/material.dart';

import 'Constantes.dart';
import 'cardTarefas.dart';
import 'Modelos/modTarefas.dart';
import 'Responsividade.dart';

class MinhasTarefas extends StatelessWidget {
  const MinhasTarefas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tarefas", style: Theme.of(context).textTheme.headline6)
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: InfoTarefaCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: InfoTarefaCardGridView(),
          desktop: InfoTarefaCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InfoTarefaCardGridView extends StatelessWidget {
  const InfoTarefaCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listatarefas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          TarefaInfoCard(info: listatarefas[index]),
    );
  }
}
