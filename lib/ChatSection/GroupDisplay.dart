import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUsers {
  String group_name;
  String last_message;
  String time;
  ChatUsers(
      {required this.group_name,
      required this.last_message,
      required this.time});
}
