import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:twe/components/Nofication/pushNotification.dart';

class ListSessionPage extends StatefulWidget {
  ListSessionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListSessionPage();
}

class _ListSessionPage extends State<ListSessionPage> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  PushNotification? _notificationInfo;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void registerNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true, badge: true, provisional: false, sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("on app");
        PushNotification notification = PushNotification(
            title: message.notification!.title,
            body: message.notification!.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body']);

        setState(() {
          _notificationInfo = notification;
        });
        print("notification: $notification");
        if (notification != null) {
          _showNotification(
              _notificationInfo!.title!, _notificationInfo!.body!);
          // showSimpleNotification(Text(_notificationInfo!.title!),
          //     leading: Container(
          //       height: 40,
          //       child: Text("1"),
          //     ),
          //     subtitle: Text(_notificationInfo!.body!),
          //     background: MaterialColors.primary,
          //     duration: Duration(seconds: 5));
        }
      });
    } else {
      print("not permission");
    }
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("Thông báo"),
          content: Text("Push Notification : 123"),
        );
      },
    );
  }

  Future<void> _showNotification(String title, String content) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(0, title, content, platformChannelSpecifics, payload: 'item x');
  }

  @override
  void initState() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (value) {
      onSelectNotification("123");
    });
    registerNotification();
    // checkForInitialMessage();
    super.initState();
  }

  // Future<void> _firebaseMessagingBackgroundHandler(
  //   RemoteMessage message,
  // ) async {
  //   await Firebase.initializeApp();
  //   print('onBackgroundMessage received: $message');
  // }

  // checkForInitialMessage() async {
  //   RemoteMessage? initialMessage =
  //       await FirebaseMessaging.instance.getInitialMessage();
  //   // if (initialMessage != null) {
  //   print("close app");
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   //   print("close app ne");
  //   //   PushNotification notification = PushNotification(
  //   //       title: message.notification!.title,
  //   //       body: message.notification!.body,
  //   //       dataTitle: message.data['title'],
  //   //       dataBody: message.data['body']);

  //   //   setState(() {
  //   //     _notificationInfo = notification;
  //   //   });
  //   //   print("notification: $notification");
  //   //   if (notification != null) {
  //   //     _showNotification(_notificationInfo!.title!, _notificationInfo!.body!);

  //   //   }
  //   // });
  // }

  submit() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  submit();
                  // _showNotification();
                },
                child: Text("Gửi thông báo"))
          ],
        ),
      ),
    );
  }
}
