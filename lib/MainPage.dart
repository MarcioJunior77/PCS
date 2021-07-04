import 'package:flutter/material.dart';
import 'package:pcs/ChatSection/TopBar.dart';

import 'ChatSection/ChatPage.dart';
// import 'package:pcs/topBar.dart';
// import 'package:pcs/Input.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: ToppBar(),
      //   body: Input(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal.shade300,
        unselectedItemColor: Colors.grey.shade400,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        backgroundColor: Colors.grey.shade900,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Chat"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            title: Text("To-do-list"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            title: Text("Monitoramento"),
          ),
        ],
      ),
      appBar: TopBar(),
      body: Chat(),
    );
  }
}
