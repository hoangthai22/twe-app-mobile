// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:twe/pages/AccountPage/hisory_page.dart';
// import 'package:twe/pages/HomePage/list_mentor_page.dart';

// class TabNavigatorRoutes {
//   static const String mentor = '/mentor';
//   static const String history = '/history';
//   // static const String coffeeDetail = '/coffee-detail';
// }

// // 2
// class NavigatorMentor extends StatelessWidget {
//   NavigatorMentor({
//     required this.navigatorKey,
//   });
//   final GlobalKey<NavigatorState> navigatorKey;

//   // 3
//   Map<String, WidgetBuilder> _routeBuilders(
//     BuildContext context,
//   ) {
//     return {
//       TabNavigatorRoutes.mentor: (context) => ListMentorPage(
//             onPush: (value) {},
//             isMentorTab: true,
//           ),
//       TabNavigatorRoutes.history: (context) => HistoryPage(
//             onPush: (value) {},
//           )
//     };
//   }

//   // 4
//   @override
//   Widget build(BuildContext context) {
//     final routeBuilders = _routeBuilders(context);

//     return Navigator(
//       key: navigatorKey,
//       initialRoute: TabNavigatorRoutes.mentor,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) =>
//               routeBuilders[TabNavigatorRoutes.mentor]!(context),
//         );
//       },
//     );
//   }
// }
