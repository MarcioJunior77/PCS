import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pcs/ChatSection/Sections.dart';
import 'package:pcs/ChatSection/SectionDisplay.dart';
import 'package:pcs/ChatSection/GroupsDesign.dart';
import 'package:pcs/ChatSection/GroupDisplay.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:pcs/topBar.dart';
// import 'package:pcs/Input.dart';
class Chat extends StatefulWidget {
  final docs;

  const Chat({Key? key, this.docs}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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

  List<ChatSections> chatSections0 = [
    ChatSections(
      text: "Seções de Software",
    ),
  ];
  List<ChatUsers> chatUsers0 = [
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Acabei de enviar os arquivos relacionados...",
        time: "Agora"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Preciso dos arquivos da pasta master par...",
        time: "15:16"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Como esta o andamento da nova atualiza...",
        time: "19:42"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Ocorreu um problema com a pasta main, ...",
        time: "Ontem"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Estamos concluindo as últimas configura...",
        time: "Ontem"),
  ];
  List<ChatSections> chatSections1 = [
    ChatSections(
      text: "Seções de Marketing",
    ),
  ];
  List<ChatUsers> chatUsers1 = [
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Acabei de enviar os videos relacionados...",
        time: "Agora"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Preciso dos arquivos da pasta master par...",
        time: "15:16"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Como esta o andamento da nova atualiza...",
        time: "19:42"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Ocorreu um problema com a pasta main, ...",
        time: "Ontem"),
    ChatUsers(
        group_name: "Nome do Grupo",
        last_message: "Estamos concluindo as últimas configura...",
        time: "Ontem"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 15, bottom: 10, right: 15),
                    hintText: "Digite um texto...",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    fillColor: Colors.grey[200],
                    filled: true),
              ),
            ),
            ListView.builder(
              itemCount: chatSections0.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SectionList(
                  text: chatSections0[index].text,
                );
              },
            ),
            ListView.builder(
              itemCount: chatUsers0.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUsersList(
                  group_name: chatUsers0[index].group_name,
                  last_message: chatUsers0[index].last_message,
                  time: chatUsers0[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
            ListView.builder(
              itemCount: chatSections1.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SectionList(
                  text: chatSections1[index].text,
                );
              },
            ),
            ListView.builder(
              itemCount: chatUsers1.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUsersList(
                  group_name: chatUsers0[index].group_name,
                  last_message: chatUsers1[index].last_message,
                  time: chatUsers1[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
