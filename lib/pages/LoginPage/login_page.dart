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
                width: 75,
                child: Image.asset(
                  'assets/logo_transparent.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Toad Learn !",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Tìm Mentor cho bạn",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Tạo một buổi meetup cùng Mentor yêu thích một cách nhanh chóng với địa điểm tốt nhất cho bạn.",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              'assets/welcome.PNG',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
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
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Đăng Nhập",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                // context.read<AppProvider>().setUserLogin("hoangthai123");
                // context.read<AppProvider>().setIsLogin();
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(width: 1, color: MaterialColors.primary)),
              ),
              child: Text(
                "Đăng Ký",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
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
