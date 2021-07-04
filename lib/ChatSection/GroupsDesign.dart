import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcs/ChatSection/MessagesSection/MessagePage.dart';

class ChatUsersList extends StatefulWidget {
  String group_name;
  String last_message;
  String time;
  bool isMessageRead;
  ChatUsersList(
      {required this.group_name,
      required this.last_message,
      required this.time,
      required this.isMessageRead});
  @override
  _ChatUsersListState createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MessagePage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 5,
        ),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[850],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    "#",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.group_name,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.last_message,
                            style: TextStyle(
                                fontSize: 14,
                                color: widget.isMessageRead
                                    ? Colors.teal.shade400
                                    : Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: widget.isMessageRead
                      ? Colors.teal.shade400
                      : Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
