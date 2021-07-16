import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcs/ChatSection/MessagesSection/MessagePage.dart';
import 'package:pcs/ChatSection/MessagesSection/MessageDisplay.dart';

class ChatDesign extends StatefulWidget {
  ChatMessage2 chatMessage2;
  ChatDesign({required this.chatMessage2});
  @override
  _ChatDesignState createState() => _ChatDesignState();
}

class _ChatDesignState extends State<ChatDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: (widget.chatMessage2.type == MessageType.Receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: (widget.chatMessage2.type == MessageType.Receiver
                ? Colors.grey.shade800
                : Colors.grey.shade200),
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            widget.chatMessage2.message,
            style: TextStyle(
              color: (widget.chatMessage2.type == MessageType.Receiver
                  ? Colors.white
                  : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

//       Column(
//         children: [
//           Align(
//             alignment: (widget.chatMessage2.type == MessageType.Receiver
//                 ? Alignment.topLeft
//                 : Alignment.topRight),
//             child: Row(
//               children: [
//                 Container(
//                   child: Align(
//                     alignment: (widget.chatMessage2.type == MessageType.Receiver
//                         ? Alignment.topLeft
//                         : Alignment.topRight),
//                     child: Text(
//                       widget.chatMessage2.name,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.grey.shade800,
//                   ),
//                   margin: EdgeInsets.only(bottom: 10),
//                   height: 25,
//                   padding: EdgeInsets.only(left: 10, right: 10, top: 5),
//                 ),
//                 Container(
//                   child: Align(
//                     alignment: (widget.chatMessage2.type == MessageType.Receiver
//                         ? Alignment.topLeft
//                         : Alignment.topRight),
//                     child: Text(
//                       widget.chatMessage2.name,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   height: 25,
//                   margin: EdgeInsets.only(bottom: 10, left: 5),
//                   padding: EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: (widget.chatMessage2.who == MessageUser.Founder
//                         ? Colors.deepOrange[900]
//                         : Colors.blue.shade800),
//                   ),
//                   // child: Text(
//                   //   widget.chatMessage2.role,
//                   //   style: TextStyle(color: Colors.white),
//                   // ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: (widget.chatMessage2.type == MessageType.Receiver
//                 ? Alignment.topLeft
//                 : Alignment.topRight),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: (widget.chatMessage2.type == MessageType.Receiver
//                     ? Colors.white
//                     : Colors.grey.shade400),
//               ),
//               padding: EdgeInsets.all(16),
//               child: Text(widget.chatMessage2.message),
//             ),
//           ),
//         ],
//       ),
