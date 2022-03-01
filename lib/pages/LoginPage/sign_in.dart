import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/provider/appProvider.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    // checkUserAuth();
    super.initState();
    print("object");
  }

  // checkUserAuth() async {
  //   try {
  //     User user = await auth.currentUser!;
  //     if (user != null) {
  //       context.read<AppProvider>().setUserLogin(user.email);
  //       context.read<AppProvider>().setIsLogin();
  //       // Navigator.pop(context);
  //       Navigator.pushNamed(context, '/home');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  signIn() {
    String email = _email.text;
    String pass = _pass.text;
    if (email.isEmpty || pass.isEmpty) {
      showDialog(
          context: context,
          builder: (build) {
            return AlertDialog(
              title: Text("Thông báo"),
              content:
                  Text("Email hoặc mật khẩu của bạn không chính xác"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(build);
                    },
                    child: Text("OK"))
              ],
            );
          });
    } else {
      try {
        EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.clear,
        );
        auth
            .signInWithEmailAndPassword(email: email, password: pass)
            .then((value) async {
          if (value.user != null) {
            String? fcmToken = await messaging.getToken();
            User user = value.user!;
            db.collection("users").doc(user.uid).set({
              'email': user.email,
              'fcmToken': fcmToken,
            });

            context
                .read<AppProvider>()
                .setUserLogin(value.user!.email.toString());
            context.read<AppProvider>().setUid(value.user!.uid.toString());
            context.read<AppProvider>().setIsLogin();
            // Navigator.pop(context);
            EasyLoading.dismiss();
            Navigator.pushReplacementNamed(context, '/home');
          }
        }).catchError((onError) {
          showDialog(
              context: context,
              builder: (build) {
                return AlertDialog(
                  title: Text("Thông báo"),
                  content: Text(
                      "Email hoặc mật khẩu của bạn không chính xác"),
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
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
      } catch (e) {
        print(e);
        rethrow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 15, right: 15, left: 15),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Positioned(
                  child: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  size: 28,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 45,
                    child: Image.asset(
                      'assets/logo_transparent.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Chào mừng trở lại",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            padding: EdgeInsets.only(left: 20, bottom: 5, top: 5),
            decoration: BoxDecoration(
                color: MaterialColors.primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              cursorColor: MaterialColors.primary,
              controller: _email,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.account_circle,
                    size: 28,
                    color: MaterialColors.primary,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: MaterialColors.primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50)),
            child: TextField(
              controller: _pass,
              decoration: InputDecoration(
                  hintText: "Mật khẩu",
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.lock_open_outlined,
                    size: 28,
                    color: MaterialColors.primary,
                  )),
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // context.read<AppProvider>().setUserLogin("hoangthai123");
                // context.read<AppProvider>().setIsLogin();
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                signIn();
              },
              style: ElevatedButton.styleFrom(
                primary: MaterialColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(width: 1, color: MaterialColors.primary)),
              ),
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              "Quên mật khẩu của bạn?",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14,
                  color: MaterialColors.primary),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              "HOẶC",
              style: TextStyle(
                  fontFamily: "Roboto", fontSize: 15, color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(width: 1, color: Colors.grey)),
                ),
                child: Row(
                  children: [
                    Padding(
                      child: Icon(
                        Icons.facebook_rounded,
                        color: Colors.blue[700],
                        size: 28,
                      ),
                      padding: EdgeInsets.only(right: 10, left: 10),
                    ),
                    Text(
                      "Tiếp tục với Facebook",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(width: 1, color: Colors.grey)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      child: Image.asset(
                        'assets/google.png',
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.only(right: 12, left: 10),
                    ),
                    Text(
                      "Tiếp tục với Google",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
