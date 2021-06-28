import 'package:flutter/material.dart';
import 'package:pcs/topBar.dart';
import 'package:pcs/Input.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToppBar(),
      body: Input(),
    );
  }
}
