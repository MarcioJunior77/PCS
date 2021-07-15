// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pcs/ChatSection/ChatPage.dart';
import 'package:pcs/MainPage.dart';
// import 'package:pcs/ChatSection/MessagesSection/MessagePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseUser extends StatefulWidget {
  @override
  _ChooseUserState createState() => _ChooseUserState();
}

class _ChooseUserState extends State<ChooseUser> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  String? userId;

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    userId = sharedPreferences.getString('id');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () async {
                await googleSignIn.signOut();
                SharedPreferences sharedPrefs =
                    await SharedPreferences.getInstance();
                sharedPrefs.setString('id', '');
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (listContext, index) =>
                    buildItem(snapshot.data!.docs[index]),
                itemCount: snapshot.data!.docs.length,
              );
            }

            return Container();
          },
        ));
  }

  buildItem(doc) {
    return (userId != doc['id'])
        ? GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainPage(docs: doc)));
            },
            child: Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Text(doc['name']),
                  ),
                ),
              ),
            ),
          )
        : Container(
            child: Text("TESTE AQUI"),
          );
  }
}
