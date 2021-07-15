import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcs/ChatSection/MessagesSection/TopBarMessage.dart';
// import 'package:pcs/ChatSection/MessagesSection/MessageDisplay.dart';
// import 'package:pcs/ChatSection/MessagesSection/MessagesDesign.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pcs/globals.dart' as globals;

enum MessageType {
  Sender,
  Receiver,
}
enum MessageUser {
  Founder,
  Menager,
  Developer,
}

class MessagePage extends StatefulWidget {
  final docs;

  const MessagePage({Key? key, this.docs}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  String? groupChatId;
  String? userID;

  TextEditingController textEditingController = TextEditingController();

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    getGroupChatId();
    super.initState();
  }

  getGroupChatId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    userID = sharedPreferences.getString("id");

    String anotherUserId = widget.docs["id"];

    if (userID!.compareTo(anotherUserId) > 0) {
      groupChatId = "$userID - $anotherUserId";
    } else {
      groupChatId = "$anotherUserId - $userID";
    }
    setState(() {});
  }

  double num = globals.counter;
  void _incrementCounter() {
    setState(() {
      globals.counter++;
    });
    num = globals.counter;
  }

  // List<ChatMessage> chatMessage = [
  //   ChatMessage(
  //       name: "Roberto Assunção",
  //       role: "Developer",
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("messages")
            .doc(groupChatId)
            .collection(groupChatId!)
            .orderBy("timestamp", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: <Widget>[
                Expanded(
                    child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (listContext, index) =>
                      buildItem(snapshot.data!.docs[index]),
                  itemCount: snapshot.data!.docs.length,
                  reverse: true,
                )),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => sendMsg(),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  sendMsg() {
    String msg = textEditingController.text.trim();

    if (msg.isNotEmpty) {
      print("thisiscalled $msg");
      var ref = FirebaseFirestore.instance
          .collection("messages")
          .doc(groupChatId)
          .collection(groupChatId!)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.set(ref, {
          "senderId": userID,
          "anotherUserId": widget.docs["id"],
          "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
          "content": msg,
          "type": "text",
        });
      });
      scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    } else {
      print("Please enter some text to send");
    }
  }

  buildItem(doc) {
    return Padding(
      padding: EdgeInsets.only(
          top: 8.0,
          left: ((doc["senderId"] == userID) ? 64 : 0),
          right: ((doc["senderId"] == userID) ? 0 : 64)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: ((doc["senderId"] == userID)
                ? Colors.grey
                : Colors.greenAccent),
            borderRadius: BorderRadius.circular(8.0)),
        child: (doc["tyoe"] == "text")
            ? Text("${doc["content"]}")
            : Image.network(doc["content"]),
      ),
    );
  }
}


// Stack(
//         children: <Widget>[
//           ListView.builder(
//             itemCount: chatMessage.length,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return ChatDesign(
//                 chatMessage: chatMessage[index],
//               );
//             },
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 820),
//             height: 5,
//             color: Colors.teal.shade400,
//             alignment: Alignment.bottomCenter,
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               padding: EdgeInsets.only(left: 0),
//               height: 80,
//               width: double.infinity,
//               color: Colors.grey.shade900,
//               child: Row(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Container(
//                       height: 40,
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: FloatingActionButton(
//                         heroTag: "btn1",
//                         onPressed: () {},
//                         child: Icon(
//                           Icons.add_rounded,
//                           color: Colors.teal.shade400,
//                           size: 35,
//                         ),
//                         backgroundColor: Colors.grey[800],
//                         hoverColor: Colors.grey[850],
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Container(
//                       height: 40,
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: FloatingActionButton(
//                         heroTag: "btn2",
//                         onPressed: () {},
//                         child: Icon(
//                           Icons.photo_camera_rounded,
//                           color: Colors.teal.shade400,
//                         ),
//                         backgroundColor: Colors.grey[800],
//                         hoverColor: Colors.grey[850],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.grey.shade300,
//                       ),
//                       height: 40,
//                       width: 50,
//                       child: TextField(
//                         // style: ,
//                         decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(
//                                 left: 15, bottom: 10, right: 15),
//                             hintText: "Digite aqui ...",
//                             hintStyle:
//                                 TextStyle(color: Colors.white, fontSize: 18),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(50)),
//                             fillColor: Colors.grey[600],
//                             filled: true),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Container(
//                       height: 40,
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: FloatingActionButton(
//                         heroTag: "btn3",
//                         onPressed: _incrementCounter,
//                         child: Icon(
//                           Icons.send,
//                           color: Colors.teal.shade400,
//                         ),
//                         backgroundColor: Colors.grey[800],
//                         hoverColor: Colors.grey[850],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),