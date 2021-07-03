import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcs/ChatSection/messages.dart';
import 'package:pcs/ChatSection/messages2.dart';

// import 'package:pcs/topBar.dart';
// import 'package:pcs/Input.dart';
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Rafael Almeida",
        secondaryText: "Acabei de enviar!",
        image: "images/Usuario1.jpg",
        time: "Agora"),
    ChatUsers(
        text: "Carlos Barbosa",
        secondaryText: "Acabei de enviar!",
        image: "images/Usuario2.jpg",
        time: "18:41"),
    ChatUsers(
        text: "Danilo Freitas",
        secondaryText: "Acabei de enviar!",
        image: "images/Usuario3.jpg",
        time: "15:23"),
    ChatUsers(
        text: "Raquel Soares",
        secondaryText: "Acabei de enviar!",
        image: "images/Usuario4.jpg",
        time: "11:08"),
    ChatUsers(
        text: "Leticia Souza",
        secondaryText: "Acabei de enviar!",
        image: "images/Usuario5.jpg",
        time: "08:54"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: ToppBar(),
      //   body: Input(),
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.business_center,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      "Nome da Empresa",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade300),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.teal.shade300,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "Nova Sala",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 50),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUsersList(
                  text: chatUsers[index].text,
                  secondaryText: chatUsers[index].secondaryText,
                  image: chatUsers[index].image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// class _ChatState extends State<Chat> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBarMain(context),
//       body: Container(
//         child: Stack(
//           children: [
//             chatMessages(),
//             Container(alignment: Alignment.bottomCenter,
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//                 color: Color(0x54FFFFFF),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                           controller: messageEditingController,
//                           style: simpleTextStyle(),
//                           decoration: InputDecoration(
//                               hintText: "Message ...",
//                               hintStyle: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                               border: InputBorder.none
//                           ),
//                         )),
//                     SizedBox(width: 16,),
//                     GestureDetector(
//                       onTap: () {
//                         addMessage();
//                       },
//                       child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [
//                                     const Color(0x36FFFFFF),
//                                     const Color(0x0FFFFFFF)
//                                   ],
//                                   begin: FractionalOffset.topLeft,
//                                   end: FractionalOffset.bottomRight
//                               ),
//                               borderRadius: BorderRadius.circular(40)
//                           ),
//                           padding: EdgeInsets.all(12),
//                           child: Image.asset("assets/images/send.png",
//                             height: 25, width: 25,)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }
