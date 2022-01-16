import 'package:flutter/material.dart';

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
  final List<String> entries = <String>[
    'Tài khoản',
    'Thông báo',
    'Lịch sử',
    'Gia sư Yêu thích',
    'Liên hệ với chúng tôi',
    'Đăng xuất'
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
                                    fontSize: 13, color: Colors.black87),
                              ),
                              margin: EdgeInsets.only(left: 20, bottom: 8),
                            ),
                            Container(
                              child: Text(
                                "ID Tài khoản: 1231241321",
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black45),
                              ),
                              margin: EdgeInsets.only(left: 20, top: 8),
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
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () => {onClick(entries[index])},
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
                              child: Text(
                                entries[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
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
