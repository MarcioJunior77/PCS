import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'MessagePage.dart';

class ChatMessage2 {
  String name;
  String role;
  String message;
  MessageType type;
  MessageUser who;
  ChatMessage2(
      {required this.message,
      required this.who,
      required this.type,
      required this.name,
      required this.role});
}

// class ChatMessage {
//   String message;
//   MessageType type;
//   ChatMessage({required this.message, required this.type});
// }
