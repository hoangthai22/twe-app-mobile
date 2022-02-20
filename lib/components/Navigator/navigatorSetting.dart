// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:twe/common/constants.dart';
// import 'package:twe/components/app.dart';
// import 'package:twe/pages/AccountPage/acount_page.dart';
// import 'package:twe/pages/AccountPage/feedback_session_page.dart';
// import 'package:twe/pages/AccountPage/hisory_page.dart';
// import 'package:twe/pages/AccountPage/history_detail_page.dart';
// import 'package:twe/pages/AccountPage/my_session.dart';
// import 'package:twe/pages/AccountPage/profile_page.dart';
// import 'package:twe/pages/HomePage/coffee_detail_page.dart';
// import 'package:twe/pages/HomePage/mentor_detail_page.dart';
// import 'package:twe/pages/NoficationPage/nofication_page.dart';
// import 'package:twe/pages/SearchPage/home_page.dart';

// class TabNavigatorRoutes {
//   static const String setting = '/setting';
//   static const String sessions = '/my-session';
//   static const String history = '/history';
//   static const String profile = '/profile';
//   static const String notification = '/notification';
//   static const String historyDetail = '/history-detail';
//   static const String feedbackSession = '/feedback-session';
//   static const String coffeeDetail = '/coffee-detail';
//   static const String mentorDetail = '/mentor-detail';
// }

// // 2
// class NavigatorSetting extends StatelessWidget {
//   NavigatorSetting({
//     required this.navigatorKey,
//   });
//   final GlobalKey<NavigatorState> navigatorKey;

//   // 3
//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context, {id}) {
//     return {
//       TabNavigatorRoutes.setting: (context) => AccountPage(
//           onPush: (settingCondition) =>
//               _pushRedirect(context, settingCondition)),
//       TabNavigatorRoutes.sessions: (context) => MySession(),
//       TabNavigatorRoutes.history: (context) => HistoryPage(
//             onPush: (historyId) => _pushRoutes(
//                 context, historyId, TabNavigatorRoutes.historyDetail),
//           ),
//       TabNavigatorRoutes.profile: (context) => ProfilePage(),
//       TabNavigatorRoutes.historyDetail: (context) => HistoryDetailPage(
//           historyId: id,
//           onFeedback: () =>
//               _pushRoutes(context, id, TabNavigatorRoutes.feedbackSession),
//           onMentorDetail: (id) =>
//               _pushRoutes(context, id, TabNavigatorRoutes.mentorDetail),
//           onCoffeeDetail: (id) =>
//               _pushRoutes(context, id, TabNavigatorRoutes.coffeeDetail)),
//       TabNavigatorRoutes.feedbackSession: (context) => FeedbackSessionPage(
//             historyId: id,
//           ),
//       TabNavigatorRoutes.coffeeDetail: (context) => CoffeeDetailPage(
//             coffeeId: id,
//             onPush: (value) {},
//           ),
//       TabNavigatorRoutes.mentorDetail: (context) => MentorDetailPage(
//             mentorId: id,
//             onPush: (value) {},
//           ),
//       TabNavigatorRoutes.notification: (context) => NoficationPage(),
//     };
//   }

//   // 4
//   @override
//   Widget build(BuildContext context) {
//     // print("contextSearch: $context");
//     final routeBuilders = _routeBuilders(context);

//     return Navigator(
//       key: navigatorKey,
//       initialRoute: TabNavigatorRoutes.setting,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) =>
//               routeBuilders[TabNavigatorRoutes.setting]!(context),
//         );
//       },
//     );
//   }

//   // 5
//   void _pushRedirect(BuildContext context, settingCondition) {
//     var routeBuilders = _routeBuilders(context);
//     print(settingCondition);
//     print(btnSetting[ButtonSetting.nofi]);
//     // if (settingCondition == btnSetting[ButtonSetting.logout].toString()) {
//     //   // Navigator.of(context).popUntil((route) => route.isFirst);
//     //   // onPush();
//     // } else {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) {
//         if (settingCondition == btnSetting[ButtonSetting.sessions].toString()) {
//           return routeBuilders[TabNavigatorRoutes.sessions]!(context);
//         } else if (settingCondition ==
//             btnSetting[ButtonSetting.history].toString()) {
//           return routeBuilders[TabNavigatorRoutes.history]!(context);
//         } else if (settingCondition ==
//             btnSetting[ButtonSetting.nofi].toString()) {
//           return routeBuilders[TabNavigatorRoutes.notification]!(context);
//         } else {
//           return routeBuilders[TabNavigatorRoutes.profile]!(context);
//         }
//       }),
//     );
//     // }
//   }

//   void _pushRoutes(BuildContext context, id, feedbackSession) {
//     var routeBuilders = _routeBuilders(context, id: id);

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => routeBuilders[feedbackSession]!(context),
//       ),
//     );
//   }

//   // void _pushRedirect(BuildContext context, id, feedbackSession) {
//   //   var routeBuilders = _routeBuilders(context, historyId: historyId);
//   //   Navigator.push(
//   //     context,
//   //     MaterialPageRoute(
//   //       builder: (context) =>
//   //           routeBuilders[TabNavigatorRoutes.feedbackSession]!(context),
//   //     ),
//   //   );
//   // }
// }
