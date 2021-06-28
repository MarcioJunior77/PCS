import 'package:flutter/material.dart';

class ToppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        padding: const EdgeInsets.all(10),
        icon: const Icon(
          Icons.menu,
          size: 30,
        ),
        tooltip: "ir para outra sala",
        onPressed: () {},
      ),
      title: Text("Nome da Sala"),
      actions: <Widget>[
        IconButton(
          padding: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
          tooltip: "Pesquisar conversa",
          splashRadius: 30,
          onPressed: () {},
        ),
        IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(
              Icons.push_pin_outlined,
              size: 30,
            ),
            tooltip: "Fixar mensagem",
            splashRadius: 30,
            onPressed: () {}),
        IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
            tooltip: "Membros da sala",
            splashRadius: 30,
            onPressed: () {}),
      ],
      backgroundColor: Color(0xff303234),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
