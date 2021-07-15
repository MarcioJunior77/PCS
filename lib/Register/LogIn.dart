import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:pcs/ChatSection/ChatPage.dart';
// import 'package:pcs/MainPage.dart';
import 'package:pcs/Register/ChooseUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool pageInitialised = false;

  final googleSignIn = GoogleSignIn();

  final firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    checkIfUserIsLoggedIn();
    super.initState();
  }

  checkIfUserIsLoggedIn() async {
    // await googleSignIn.signOut();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setString("id", '');
    bool userLoggedIn = (sharedPreferences.getString("id") ?? "").isEmpty;

    if (userLoggedIn) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChooseUser()));
    } else {
      setState(() {
        pageInitialised = true;
      });
    }
  }

  handleSignIn() async {
    final res = await googleSignIn.signIn();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final auth = await res!.authentication;

    final credentials = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);

    final firebaseUser =
        (await firebaseAuth.signInWithCredential(credentials)).user;

    if (firebaseUser != null) {
      final result = (await FirebaseFirestore.instance
              .collection("users")
              .where("id", isEqualTo: firebaseUser.uid)
              .get())
          .docs;

      if (result.length == 0) {
        //New User

        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .set({
          "id": firebaseUser.uid,
          "name": firebaseUser.displayName,
          "profile_pic": firebaseUser.photoURL,
          "created_at": DateTime.now().millisecondsSinceEpoch,
        });

        sharedPreferences.setString("id", firebaseUser.uid);
        sharedPreferences.setString("name", firebaseUser.displayName!);
        sharedPreferences.setString("profile_pic", firebaseUser.photoURL!);

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChooseUser()));
      } else {
        //Old User

        sharedPreferences.setString("id", result[0]["id"]);
        sharedPreferences.setString("name", result[0]["name"]);
        sharedPreferences.setString("profile_pic", result[0]["profile_pic"]);

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChooseUser()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (pageInitialised)
          ? Center(
              child: ElevatedButton(
                child: Text("Sign in"),
                onPressed: handleSignIn(),
              ),
            )
          : Center(
              child: SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
    );
  }
}
