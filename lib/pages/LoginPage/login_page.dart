import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/provider/appProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
  LoginPage({Key? key}) : super(key: key);
}

class _LoginPage extends State<LoginPage> {
  // FirebaseAuth auth = FirebaseAuth.instance;

  // @override
  // void initState() {
  //   checkUserAuth();
  //   super.initState();
  // }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "The Weekend Expertise",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Tìm gia sư cho bạn",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Tạo một buổi học cùng giảng viên yêu thích một cách nhanh chóng ",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              'assets/support.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.only(top: 25),
            child: ElevatedButton(
              onPressed: () {
                // context.read<AppProvider>().setUserLogin("hoangthai123");
                // context.read<AppProvider>().setIsLogin();
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/sign-in');
              },
              style: ElevatedButton.styleFrom(
                primary: MaterialColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Đăng Nhập",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // context.read<AppProvider>().setUserLogin("hoangthai123");
                // context.read<AppProvider>().setIsLogin();
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/sign-in');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(width: 1, color: MaterialColors.primary)),
              ),
              child: Text(
                "Đăng Ký",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: MaterialColors.primary),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
