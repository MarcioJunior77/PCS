// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'dart:async'; // new
import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcs/MainPage.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final String title = 'Set up Firebase and Flutter';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: title,
//       theme: ThemeData(primarySwatch: Colors.deepOrange),
//       home: MainPage(title: title),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   final String title;

//   const MainPage({
//     required this.title,
//   });

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   void initState() {
//     super.initState();

//     upload();
//   }

//   Future upload() async {
//     // Initialize Firebase(Comment)
//     await Firebase.initializeApp();

//     // Upload document to firestore(Comment)
//     final refUser = FirebaseFirestore.instance.collection('user').doc();
//     await refUser.set({'username': 'Marcio'});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(),
//     );
//   }
// }
