import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcs/ChatSection/MessagesSection/MessagePage.dart';

class SectionList extends StatefulWidget {
  String text;
  SectionList({required this.text});
  @override
  _SectionListState createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MessagePage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.text,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
