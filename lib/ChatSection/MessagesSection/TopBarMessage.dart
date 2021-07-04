import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppBarMessage extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 70,
              color: Colors.grey.shade900,
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Nome da Sala",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.teal.shade400),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.push_pin_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 55),
              height: 2,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }

  @override
  //TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
