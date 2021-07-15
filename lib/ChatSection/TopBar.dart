import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        padding: const EdgeInsets.all(10),
        icon: const Icon(
          Icons.business_center,
          color: Colors.white,
          size: 30,
        ),
        tooltip: "Descrição da Empresa",
        onPressed: () {},
      ),
      title: Text(
        "Nome da Empresa",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade300),
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          height: 50,
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ],
      backgroundColor: Colors.grey.shade900,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
