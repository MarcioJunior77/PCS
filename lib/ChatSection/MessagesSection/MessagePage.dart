import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcs/ChatSection/MessagesSection/TopBarMessage.dart';
import 'package:pcs/ChatSection/MessagesSection/MessageDisplay.dart';
import 'package:pcs/ChatSection/MessagesSection/MessagesDesign.dart';
import 'package:pcs/globals.dart' as globals;
import 'package:pcs/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum MessageType {
  Sender,
  Receiver,
}
enum MessageUser {
  Founder,
  Menager,
  Developer,
}

class ChatMessage {
  ChatMessage({required this.message});
  final String message;
}

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  FutureOr<DocumentReference> addMessageFire(String message, int counter) {
    return FirebaseFirestore.instance.collection('mensagens').add({
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'counter': counter,
    });
  }

  Future<void> init2() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      _chatSubscription = FirebaseFirestore.instance
          .collection('chatbook')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((snapshot) {
        _chatMessages = [];
        snapshot.docs.forEach((document) {
          _chatMessages.add(
            ChatMessage(
              message: document.data()['text'],
            ),
          );
        });
        // notifyListeners();
      });
      // notifyListeners();
    });
  }

  Future<void> init() async {
    await Firebase.initializeApp();
    _chatSubscription = FirebaseFirestore.instance
        .collection('mensagens')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      _chatMessages = [];
      snapshot.docs.forEach((document) {
        print("Looks like I have ${document.data()}");
        _chatMessages.add(
          ChatMessage(
            message: document.data()['text'],
          ),
        );
      });
    });
  }

  StreamSubscription<QuerySnapshot>? _chatSubscription;
  List<ChatMessage> _chatMessages = [];
  List<ChatMessage> get chatMessages => _chatMessages;

  // List<ChatMessage> chatMessage = [
  //   ChatMessage(
  //       name: "Roberto Assunção",
  //       role: "Developer",j
  //       message: "Já Mandei os arquivos",
  //       type: MessageType.Receiver,
  //       who: MessageUser.Developer),
  //   ChatMessage(
  //       name: "Cristina Ferreira",
  //       role: "Developer",
  //       message: "Já Mandei os arquivos",
  //       type: MessageType.Receiver,
  //       who: MessageUser.Developer),
  //   ChatMessage(
  //       name: "Rafael Pinheiro",
  //       role: "Founder",
  //       message: "Já Mandei os arquivos",
  //       type: MessageType.Sender,
  //       who: MessageUser.Founder),
  //   ChatMessage(
  //       name: "Augusto Alves",
  //       role: "Developer",
  //       message: "Já Mandei os arquivos",
  //       type: MessageType.Receiver,
  //       who: MessageUser.Menager),
  //   ChatMessage(
  //       name: "Rafael Pinheiro",
  //       role: "Founder",
  //       message: "Já Mandei os arquivos",
  //       type: MessageType.Sender,
  //       who: MessageUser.Founder),
  //   ChatMessage(
  //       name: "Cristina Ferreira",
  //       role: "Developer",
  //       message: "Já Mandei os arquivos",
  //       type: MessageType.Receiver,
  //       who: MessageUser.Developer),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBarMessage(),
      body: Stack(
        children: <Widget>[
          // ListView.builder(
          //   itemCount: chatMessage.length,
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return ChatDesign(
          //       chatMessage: chatMessage[index],
          //     );
          //   },
          // ),
          Container(
            margin: EdgeInsets.only(top: 720),
            height: 5,
            color: Colors.teal.shade400,
            alignment: Alignment.bottomCenter,
          ),

          EnviarMsg(
            addMessage: (String message, int counter) =>
                addMessageFire(message, counter),
          ),
        ],
      ),
    );
  }

  addMessage(String message, int counter) {}
}

class EnviarMsg extends StatefulWidget {
  EnviarMsg({required this.addMessage});
  final FutureOr<void> Function(String message, int counter) addMessage;

  @override
  _EnviarMsgState createState() => _EnviarMsgState();
}

class _EnviarMsgState extends State<EnviarMsg> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EnviarMsgState');
  final _controller = TextEditingController();
  int x = 0;
  int num1 = globals.counter2;
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      globals.counter2++;
      counter++;
    });
    num1 = globals.counter2;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
          padding: EdgeInsets.only(left: 0),
          height: 80,
          width: double.infinity,
          color: Colors.grey.shade900,
          child: Form(
            key: _formKey,
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 20),
                    child: FloatingActionButton(
                      heroTag: "btn1",
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
                      heroTag: "btn2",
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
                    child: TextFormField(
                      //ESCREVER MSG
                      controller: _controller,
                      // style: ,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 15, bottom: 10, right: 15),
                          hintText: "Digite aqui ...",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                          fillColor: Colors.grey[600],
                          filled: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          x = 1;
                        } else {
                          x = 0;
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 20),
                    child: FloatingActionButton(
                      //ENVIAR MSG
                      heroTag: "btn3",
                      onPressed: () async {
                        if (_formKey.currentState!.validate() && x != 1) {
                          _incrementCounter();
                          await widget.addMessage(_controller.text, counter);
                          _controller.clear();
                        }
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.teal.shade400,
                      ),
                      backgroundColor: Colors.grey[800],
                      hoverColor: Colors.grey[850],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
