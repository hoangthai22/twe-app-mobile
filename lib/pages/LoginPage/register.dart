import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/TextField/customTextField.dart';
import 'package:twe/models/major.dart';
import 'package:twe/provider/appProvider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  bool isRegisterSuccess = false;
  String _major = '';
  String _majorID = '';
  String _grade = '';
  List<MajorModel> listMajors = [MajorModel(majorId: "m1", majorName: "IT")];
  List<String> listGrade = [
    "K12",
    "K13",
    "K14",
    "K15",
    "K16",
    "K17",
    "K18",
  ];
  String errorText = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (auth.currentUser != null) {
      print(auth.currentUser?.email);
      var email = auth.currentUser?.email;
      var name = auth.currentUser?.displayName;
      setState(() {
        _email.text = email!;
        _fullName.text = name!;
      });
      print(auth.currentUser?.displayName);
    }
    ApiServices.getMajors().then((value) => {
          setState(
            () => {listMajors = value},
          )
        });
  }

  @override
  void dispose() {
    if (auth.currentUser != null && isRegisterSuccess == false) {
      print("delete");
      auth.currentUser?.delete();
    }
    super.dispose();
  }

  register() async {
    String email = _email.text;
    String pass = _pass.text;
    String confirmPass = _confirmPass.text;
    String fullName = _fullName.text;
    print("email: $email");
    print("pass: $pass");
    print("_confirmPass: $confirmPass");
    print("_fullName: $fullName");
    print(_major);

    if (_formKey.currentState!.validate()) {
      if (pass != confirmPass) {
        setState(() {
          errorText = "Mật nhập nhập lại không trùng khớp";
        });
      } else if (_major.isNotEmpty) {
        try {
          EasyLoading.show(
            status: 'loading...',
            maskType: EasyLoadingMaskType.clear,
          );
          if (auth.currentUser != null) {
            print("dang ky bang gmail");
            String? fcmToken = await messaging.getToken();

            ApiServices.postRegiter(
                    auth.currentUser!.uid, fullName, email, _major)
                .then((result) => {
                      if (result != null)
                        {
                          setState(() {
                            isRegisterSuccess = true;
                          }),
                          ApiServices.postLoginToInsertFCM(
                                  auth.currentUser!.uid, fcmToken!)
                              .then((role) => {
                                    print("value: $role"),
                                    if (role != null)
                                      {
                                        if (role == "1")
                                          {
                                            db
                                                .collection("users")
                                                .doc(auth.currentUser!.uid)
                                                .set({
                                              'email': auth.currentUser!.email,
                                              'fcmToken': fcmToken,
                                            }),
                                            context
                                                .read<AppProvider>()
                                                .setUserLogin(auth
                                                    .currentUser!.email
                                                    .toString()),
                                            context.read<AppProvider>().setUid(
                                                auth.currentUser!.uid
                                                    .toString()),
                                            context
                                                .read<AppProvider>()
                                                .setIsLogin(),
                                            // Navigator.pop(context);
                                            EasyLoading.dismiss(),
                                            Navigator.pushReplacementNamed(
                                                context, '/home')
                                          }
                                      }
                                  })
                        }
                    });
          } else {
            print("dang ky bang tk mk");
            String? fcmToken = await messaging.getToken();
            await auth
                .createUserWithEmailAndPassword(
                    email: email.toString(), password: pass.toString())
                .then((value) => {
                      ApiServices.postRegiter(
                              auth.currentUser!.uid, fullName, email, _major)
                          .then((result) => {
                                if (result != null)
                                  {
                                    setState(() {
                                      isRegisterSuccess = true;
                                    }),
                                    ApiServices.postLoginToInsertFCM(
                                            auth.currentUser!.uid, fcmToken!)
                                        .then((role) => {
                                              print("value: $role"),
                                              if (role != null)
                                                {
                                                  if (role == "1")
                                                    {
                                                      db
                                                          .collection("users")
                                                          .doc(auth
                                                              .currentUser!.uid)
                                                          .set({
                                                        'email': auth
                                                            .currentUser!.email,
                                                        'fcmToken': fcmToken,
                                                      }),
                                                      context
                                                          .read<AppProvider>()
                                                          .setUserLogin(auth
                                                              .currentUser!
                                                              .email
                                                              .toString()),
                                                      context
                                                          .read<AppProvider>()
                                                          .setUid(auth
                                                              .currentUser!.uid
                                                              .toString()),
                                                      context
                                                          .read<AppProvider>()
                                                          .setIsLogin(),
                                                      // Navigator.pop(context);
                                                      EasyLoading.dismiss(),
                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context, '/home')
                                                    }
                                                }
                                            })
                                  }
                              })
                    });

            // print("credential: ${credential.user!.email.toString()}");
          }
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng ký thành công')),
          );
          setState(() {
            errorText = "";
          });
        } on FirebaseAuthException catch (e) {
          print(e.code);
          if (e.code.toString().endsWith("email-already-in-use")) {
            setState(() {
              errorText = "Email đã được sử dụng bởi một tài khoản khác!";
            });
          } else if (e.code.toString().endsWith("weak-password")) {
            setState(() {
              errorText = "Mật khẩu phải có ít nhất 6 ký tự!";
            });
          }
        }
      } else {
        setState(() {
          errorText = "Vui lòng chọn chuyên ngành";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
                padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Form(
                  key: _formKey,
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
                              size: 35,
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
                                width: 60,
                                child: Image.asset(
                                  'assets/coctrensach5.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Hãy bắt đầu",
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
                          top: 30,
                        ),
                        height: 30,
                        child: Text(
                          errorText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MaterialColors.error),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 5,
                        ),
                        padding: EdgeInsets.only(left: 0, bottom: 5, top: 5),
                        child: CustomTextField(
                            controller: _email,
                            obscureText: false,
                            icon: Icon(
                              Icons.email,
                              color: MaterialColors.primary,
                              size: 28,
                            ),
                            hintText: "Email"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 0, bottom: 5, top: 5),
                        child: CustomTextField(
                            obscureText: false,
                            controller: _fullName,
                            icon: Icon(
                              Icons.account_circle_rounded,
                              color: MaterialColors.primary,
                              size: 28,
                            ),
                            hintText: "Họ và tên"),
                      ),
                      if (auth.currentUser == null) ...[
                        Container(
                          padding: EdgeInsets.only(left: 0, bottom: 5, top: 5),
                          child: CustomTextField(
                              obscureText: true,
                              controller: _pass,
                              icon: Icon(
                                Icons.lock_open_outlined,
                                color: MaterialColors.primary,
                                size: 28,
                              ),
                              hintText: "Mật khẩu"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0, bottom: 5, top: 5),
                          child: CustomTextField(
                              obscureText: true,
                              controller: _confirmPass,
                              icon: Icon(
                                Icons.lock_open_outlined,
                                color: MaterialColors.primary,
                                size: 28,
                              ),
                              hintText: "Nhập lại mật khẩu"),
                        ),
                      ],
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(
                            left: 10, top: 5, bottom: 5, right: 20),
                        decoration: BoxDecoration(
                            color: MaterialColors.primary.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)),
                        child: listMajors.length > 0
                            ? FormField<String>(
                                builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                          fontSize: 14.0, height: 0.1),
                                      hintText: "Chọn chuyên ngành",
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.school,
                                        size: 28,
                                        color: MaterialColors.primary,
                                      )),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _major == '' ? null : _major,
                                      isDense: true,
                                      hint: Text("Chọn chuyên ngành"),
                                      onChanged: (value) {
                                        setState(() {
                                          _major = value!;
                                        });
                                      },
                                      items: listMajors.map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.majorId,
                                          child: Text(value.majorName),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              })
                            : TextField(
                                controller: _confirmPass,
                                decoration: InputDecoration(
                                    hintText: "Chọn chuyên ngành",
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.school,
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

                            register();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: MaterialColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                    width: 1, color: MaterialColors.primary)),
                          ),
                          child: Text(
                            "Đăng ký",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
