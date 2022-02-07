import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    checkUserAuth();
    super.initState();
  }

  checkUserAuth() async {
    try {
      User user = await auth.currentUser!;
      if (user != null) {
        context.read<AppProvider>().setUserLogin(user.email);
        context.read<AppProvider>().setIsLogin();
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      print(e);
    }
  }

  signIn() {
    String email = _email.text;
    String pass = _pass.text;
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) async {
        if (value.user != null) {
          String? fcmToken = await messaging.getToken();
          User user = value.user!;
          db
              .collection("users")
              .doc(user.uid)
              .set({'email': user.email, 'fcmToken': fcmToken,});

          // messaging.subscribeToTopic("notification");

          context
              .read<AppProvider>()
              .setUserLogin(value.user!.email.toString());
          context.read<AppProvider>().setIsLogin();
          Navigator.pop(context);
          Navigator.pushNamed(context, '/home');
        }
      }).catchError((onError) {
        showDialog(
            context: context,
            builder: (build) {
              return AlertDialog(
                title: Text("Sai"),
                content: Text("Sai luon"),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(build);
                      },
                      child: Text("OK"))
                ],
              );
            });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("login");
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 200, left: 30, right: 30),
            child: Column(
              children: [
                TextField(
                  controller: _email,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: _pass,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    signIn();
                    // context.read<AppProvider>().setUserLogin("hoangthai123");
                    // context.read<AppProvider>().setIsLogin();
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '/home');
                  },
                  child: Text("Login"),
                )),
              ],
            )));
  }
}
