import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/account.dart';
import 'package:twe/provider/appProvider.dart';

class _AccountPage extends State<AccountPage> {
  final List<AccountModel> account = <AccountModel>[
    AccountModel(
        title: btnSetting[ButtonSetting.account].toString(),
        icon: Icons.account_circle),
    AccountModel(
        title: btnSetting[ButtonSetting.history].toString(),
        icon: Icons.history),
    AccountModel(
        title: btnSetting[ButtonSetting.sessions].toString(),
        icon: Icons.school),
    AccountModel(
        title: btnSetting[ButtonSetting.nofi].toString(), icon: Icons.favorite),
    AccountModel(
        title: btnSetting[ButtonSetting.favorite].toString(),
        icon: Icons.notifications),
    AccountModel(
        title: btnSetting[ButtonSetting.contact].toString(),
        icon: Icons.contact_support),
    AccountModel(
        title: btnSetting[ButtonSetting.logout].toString(), icon: Icons.logout)
  ];

  void onClick(item, provider) {
    if (item == btnSetting[ButtonSetting.logout].toString()) {
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.signOut().then((value) => provider.setIsLogout());
      Navigator.pushNamed(context, '/');
    } else if (item == btnSetting[ButtonSetting.nofi].toString()) {
      Navigator.pushNamed(context, '/notification');
    }
    // } else if (index == btnSetting[ButtonSetting.history]) {
    //   Navigator.pushNamed(context, '/history');
    // } else if (index == btnSetting[ButtonSetting.sessions]) {
    //   Navigator.pushNamed(context, '/my-session');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: MaterialColors.primary,
            automaticallyImplyLeading: false,
            title: const Center(
              child: Text(
                "Thiết lập",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                ),
              ),
            )),
        body: Consumer<AppProvider>(builder: (context, provider, child) {
          return Column(children: <Widget>[
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
                                  provider.getUserId,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 20, bottom: 8),
                              ),
                              Container(
                                child: Text(
                                  "ID: ${provider.getUid}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
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
                      return Consumer<AppProvider>(
                          builder: (context, provider, child) {
                        return InkWell(
                            onTap: () => {
                                  onClick(account[index].title, provider),
                                },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 15),
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
                                              color: Colors.black12,
                                              width: 1.0))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      Expanded(
                                        child: Icon(account[index].icon,
                                            color: MaterialColors.primary),
                                        flex: 2,
                                      )
                                    ],
                                  )),
                            ));
                      });
                    }))
          ]);
        }));
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPage createState() => _AccountPage();
}
