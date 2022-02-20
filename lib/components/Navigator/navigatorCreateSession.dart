// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:twe/components/app.dart';
// import 'package:twe/pages/HomePage/booking_page.dart';
// import 'package:twe/pages/HomePage/coffee_detail_page.dart';
// import 'package:twe/pages/HomePage/create_session_page.dart';
// import 'package:twe/pages/HomePage/list_session_page.dart';
// import 'package:twe/pages/HomePage/llist_cafe_page.dart';
// import 'package:twe/pages/HomePage/mentor_detail_page.dart';
// import 'package:twe/pages/HomePage/list_mentor_page.dart';

// class TabNavigatorRoutes {
//   static const String listSession = '/list-session';
//   static const String create = '/create';
//   static const String coffee = '/coffee';
//   static const String coffeeDetail = '/coffee-detail';
//   static const String mentorList = '/mentors';
//   static const String mentorDetail = '/mentor-detail';
//   static const String booking = '/booking';
// }

// // 2
// class NavigatorCreateSession extends StatelessWidget {
//   NavigatorCreateSession({required this.navigatorKey});
//   final GlobalKey<NavigatorState> navigatorKey;

//   // 3
//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
//       {int data: 500}) {
//     return {
//       TabNavigatorRoutes.listSession: (context) => ListSessionPage(
//             onPush: () => _pushCreateSession(context),
//           ),
//       TabNavigatorRoutes.create: (context) => CreateSessionPage(
//             onPush: () => _pushListCafe(context),
//           ),
//       TabNavigatorRoutes.coffee: (context) => ListCoffeePage(
//             isCoffeeTab: false,
//             coffeId: data,
//             onPush: (coffeeId) => _pushListCafeDetail(context, coffeeId),
//             onRedirect: () => _pushListMentors(context),
//           ),
//       TabNavigatorRoutes.coffeeDetail: (context) => CoffeeDetailPage(
//             coffeeId: data,
//             onPush: () => _pushListMentors(context),
//           ),
//       TabNavigatorRoutes.mentorList: (context) => ListMentorPage(
//             isMentorTab: false,
//             onPush: (materialIndex) => _pushMentorDetail(context, data),
//             onRedirect: () => _pushBooking(context),
//           ),
//       TabNavigatorRoutes.mentorDetail: (context) => MentorDetailPage(
//             mentorId: data,
//             onPush: (materialIndex) => {},
//           ),
//       TabNavigatorRoutes.booking: (context) => BookingPage(),
//     };
//   }

//   // 4
//   @override
//   Widget build(BuildContext context) {
//     // print("contextHome: $context");
//     final routeBuilders = _routeBuilders(context);

//     return Navigator(
//       key: navigatorKey,
//       initialRoute: TabNavigatorRoutes.listSession,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) =>
//               routeBuilders[TabNavigatorRoutes.listSession]!(context),
//         );
//       },
//     );
//   }

//   // 5
//   void _pushCreateSession(BuildContext context) {
//     var routeBuilders = _routeBuilders(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             routeBuilders[TabNavigatorRoutes.create]!(context),
//       ),
//     );
//   }

//   void _pushListCafe(BuildContext context) {
//     // print("object");
//     var routeBuilders = _routeBuilders(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             routeBuilders[TabNavigatorRoutes.coffee]!(context),
//       ),
//     );
//   }

//   void _pushListCafeDetail(BuildContext context, coffeeId) {
//     var routeBuilders = _routeBuilders(context, data: coffeeId);
//     // print("coffeeId: $coffeeId");
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             routeBuilders[TabNavigatorRoutes.coffeeDetail]!(context),
//       ),
//     );
//   }

//   void _pushListMentors(BuildContext context) {
//     var routeBuilders = _routeBuilders(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             routeBuilders[TabNavigatorRoutes.mentorList]!(context),
//       ),
//     );
//   }

//   void _pushMentorDetail(BuildContext context, mentorId) {
//     var routeBuilders = _routeBuilders(context, data: mentorId);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             routeBuilders[TabNavigatorRoutes.mentorDetail]!(context),
//       ),
//     );
//   }

//   void _pushBooking(BuildContext context) {
//     var routeBuilders = _routeBuilders(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             routeBuilders[TabNavigatorRoutes.booking]!(context),
//       ),
//     );
//   }
// }
