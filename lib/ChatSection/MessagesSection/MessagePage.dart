import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcs/ChatSection/MessagesSection/TopBarMessage.dart';
import 'package:pcs/ChatSection/MessagesSection/MessageDisplay.dart';
import 'package:pcs/ChatSection/MessagesSection/MessagesDesign.dart';

enum MessageType {
  Sender,
  Receiver,
}
enum MessageUser {
  Founder,
  Menager,
  Developer,
}

class MessagePage extends StatelessWidget {
  List<ChatMessage> chatMessage = [
    ChatMessage(
        name: "Roberto Assunção",
        role: "Developer",
        message: "Já Mandei os arquivos",
        type: MessageType.Receiver,
        who: MessageUser.Developer),
    ChatMessage(
        name: "Cristina Ferreira",
        role: "Developer",
        message: "Já Mandei os arquivos",
        type: MessageType.Receiver,
        who: MessageUser.Developer),
    ChatMessage(
        name: "Rafael Pinheiro",
        role: "Founder",
        message: "Já Mandei os arquivos",
        type: MessageType.Sender,
        who: MessageUser.Founder),
    ChatMessage(
        name: "Augusto Alves",
        role: "Developer",
        message: "Já Mandei os arquivos",
        type: MessageType.Receiver,
        who: MessageUser.Menager),
    ChatMessage(
        name: "Rafael Pinheiro",
        role: "Founder",
        message: "Já Mandei os arquivos",
        type: MessageType.Sender,
        who: MessageUser.Founder),
    ChatMessage(
        name: "Cristina Ferreira",
        role: "Developer",
        message: "Já Mandei os arquivos",
        type: MessageType.Receiver,
        who: MessageUser.Developer),
  ];
  // List<ChatMessage> chatMessage = [
  //   ChatMessage(message: "Já Mandei os arquivos", type: MessageType.Receiver),
  //   ChatMessage(message: "Já Mandei os arquivos", type: MessageType.Receiver),
  //   ChatMessage(message: "Já Mandei os arquivos", type: MessageType.Receiver),
  //   ChatMessage(message: "Já Mandei os arquivos", type: MessageType.Receiver),
  //   ChatMessage(message: "Já Mandei os arquivos", type: MessageType.Receiver),
  //   ChatMessage(message: "Já Mandei os arquivos", type: MessageType.Receiver),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBarMessage(),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: chatMessage.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatDesign(
                chatMessage: chatMessage[index],
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 820),
            height: 5,
            color: Colors.teal.shade400,
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 0),
              height: 80,
              width: double.infinity,
              color: Colors.grey.shade900,
              child: Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 20),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.teal.shade400,
                          size: 35,
                        ),
                        backgroundColor: Colors.grey[800],
                        hoverColor: Colors.grey[850],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 20),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.photo_camera_rounded,
                          color: Colors.teal.shade400,
                        ),
                        backgroundColor: Colors.grey[800],
                        hoverColor: Colors.grey[850],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      height: 40,
                      width: 50,
                      child: TextField(
                        // style: ,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 10, right: 15),
                            hintText: "Digite um texto...",
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                            fillColor: Colors.grey[600],
                            filled: true),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 20),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.send,
                          color: Colors.teal.shade400,
                        ),
                        backgroundColor: Colors.grey[800],
                        hoverColor: Colors.grey[850],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
