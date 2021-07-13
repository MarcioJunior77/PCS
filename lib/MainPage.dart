import 'package:flutter/material.dart';
import 'package:pcs/ChatSection/TopBar.dart';
import 'package:pcs/To-do-list/Teste(n%C3%A3o%20mexer).dart';

import 'ChatSection/ChatPage.dart';
import 'DashSection/Dash.dart';
// import 'package:pcs/topBar.dart';
// import 'package:pcs/Input.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageSelector = 0;
  final List<Widget> _sections = [Chat(), Test_to_do_list(), DashboardScreen()];

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
        currentIndex: _pageSelector,
        iconSize: 25,
        selectedFontSize: 14,
        unselectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: "To-do-list",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: "Monitoramento",
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageSelector = index;
          });
        },
      ),
      appBar: TopBar(),
      body: _sections[_pageSelector],
    );
  }
}

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //   appBar: ToppBar(),
//       //   body: Input(),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.teal.shade300,
//         unselectedItemColor: Colors.grey.shade400,
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//         unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//         backgroundColor: Colors.grey.shade900,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: 1,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: "Chat",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.assignment_rounded),
//             label: "To-do-list",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart_sharp),
//             label: "Monitoramento",
//           ),
//         ],
//       ),
//       appBar: TopBar(),
//       body: Chat(),
//     );
//   }
// }
