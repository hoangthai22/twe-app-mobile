import 'package:flutter/material.dart';
import 'package:twe/models/account.dart';

enum ButtonSetting { account, nofi, history, favorite, contact, logout }

const Map<ButtonSetting, String> btnSetting = {
  ButtonSetting.account: 'Tài khoản',
  ButtonSetting.nofi: 'Thông báo',
  ButtonSetting.history: 'Lịch sử',
  ButtonSetting.favorite: 'Gia sư Yêu thích',
  ButtonSetting.contact: 'Gia sư Yêu thích',
  ButtonSetting.logout: 'Đăng xuất',
};

class _AccountPage extends State<AccountPage> {
  final List<AccountModel> account = <AccountModel>[
    AccountModel(title: "Tài khoản", icon: Icons.account_circle),
    AccountModel(title: "Thông báo", icon: Icons.notifications),
    AccountModel(title: "Lịch sử", icon: Icons.history),
    AccountModel(title: "Gia sư Yêu thích", icon: Icons.favorite),
    AccountModel(title: "Liên hệ với chúng tôi", icon: Icons.contact_support),
    AccountModel(title: "Đăng xuất", icon: Icons.logout)
  ];

  void onClick(index) {
    if (index == btnSetting[ButtonSetting.logout]) {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Center(
              child: Text(
                "Thiết lập",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            )),
        body: Column(children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: CircleAvatar(
                          radius: 45, // Image radius
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4j5EsloB48DnxRWOYQKJxT01dGj6cVFEDPQ&usqp=CAU"),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                widget.userId,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              margin: EdgeInsets.only(left: 20, bottom: 8),
                            ),
                            Container(
                              child: Text(
                                "ID Tài khoản: 1231241321",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black45,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              margin: EdgeInsets.only(left: 20,),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: account.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () => {onClick(account[index].title)},
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                              ),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black12, width: 1.0))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                        account[index].title,
                                        style: const TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Expanded(
                                    child: Icon(account[index].icon, color: Colors.black54),
                                    flex: 2,
                                  )
                                ],
                              )),
                        ));
                  }))
        ]));
  }
}

class AccountPage extends StatefulWidget {
  late final String userId;
  AccountPage({required this.userId});

  @override
  _AccountPage createState() => _AccountPage();
}
