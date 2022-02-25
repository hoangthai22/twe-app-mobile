import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/models/notification.dart';
import 'package:twe/pages/AccountTab/acount_page.dart';
import 'package:twe/pages/HomeTab/home_page.dart';
import 'package:twe/pages/MentorTab/mentor_page_main_tab.dart';
import 'package:twe/pages/SearchTab/list_session_page.dart';
import 'package:twe/pages/SearchTab/llist_cafe_page.dart';
import 'package:twe/provider/appProvider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.home;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.mentor: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.coffee: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  PushNotificationModel? _notificationInfo;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void registerNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true, badge: true, provisional: false, sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("on app");
        PushNotificationModel notification = PushNotificationModel(
            title: message.notification!.title,
            body: message.notification!.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body']);

        setState(() {
          _notificationInfo = notification;
        });
        print("body: ${notification.body}");
        print("title: ${notification.title}");
        if (notification != null) {
          _showNotification(
              _notificationInfo!.title!, _notificationInfo!.body!);
        }
      });
    } else {
      print("not permission");
    }
  }

  // Future onSelectNotification(String payload) async {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return new AlertDialog(
  //         title: Text("Thông báo"),
  //         content: Text("Push Notification : 123"),
  //       );
  //     },
  //   );
  // }

  Future<void> _showNotification(String title, String content) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(0, title, content, platformChannelSpecifics, payload: 'item x');
  }

  @override
  void initState() {
    // var initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettingsIOS = IOSInitializationSettings();
    // var initializationSettings = InitializationSettings(
    //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (value) {
    //   onSelectNotification("123");
    // });
    registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      MentorPageMainTab(),
      const ListSessionPage(),
      ListCoffeePage(isCoffeeTab: true),
      AccountPage()
    ];

    return Consumer<AppProvider>(builder: (context, provider, child) {
      return WillPopScope(
          onWillPop: () async {
            if (provider.getIsLogin == true) {
              final isFirstRouteInCurrentTab =
                  !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
              if (isFirstRouteInCurrentTab) {
                // if not on the 'main' tab
                if (_currentTab != TabItem.home) {
                  // select 'main' tab
                  _selectTab(TabItem.home);
                  // back button handled by app
                  return false;
                }
              }
              // let system handle back button if we're on the first route
              return isFirstRouteInCurrentTab;
            } else {
              return true;
            }
          },
          child: Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: _widgetOptions.elementAt(_currentTab.index),
              ),
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                  primaryColor: Colors.red,
                ),
                child: MenuFooter(
                  currentTab: _currentTab,
                  onSelectTab: _selectTab,
                ),
              )));
    });
  }
}

enum TabItem { home, mentor, search, coffee, account }

const Map<TabItem, String> tabName = {
  TabItem.home: 'Trang chủ',
  TabItem.mentor: 'Giảng viên',
  TabItem.search: 'Tìm kiếm',
  TabItem.coffee: 'Địa điểm',
  TabItem.account: 'Cài đặt',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.mentor: Icons.account_circle,
  TabItem.search: Icons.search,
  TabItem.coffee: Icons.coffee,
  TabItem.account: Icons.settings,
};
