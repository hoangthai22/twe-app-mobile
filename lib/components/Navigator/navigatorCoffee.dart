// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:twe/components/app.dart';
// import 'package:twe/pages/HomePage/llist_cafe_page.dart';
// import 'package:twe/pages/NoficationPage/nofication_page.dart';

// class TabNavigatorRoutes {
//   static const String coffee = '/coffee';
//   // static const String coffeeDetail = '/coffee-detail';
// }

// // 2
// class NavigatorCoffee extends StatelessWidget {
//   NavigatorCoffee({
//     required this.navigatorKey,
//   });
//   final GlobalKey<NavigatorState> navigatorKey;

//   // 3
//   Map<String, WidgetBuilder> _routeBuilders(
//     BuildContext context,
//   ) {
//     return {
//       TabNavigatorRoutes.coffee: (context) => ListCoffeePage(
//             isCoffeeTab: true,
//             onPush: (value) {},
//             onRedirect: () {},
//             coffeId: 1,
//           )
//     };
//   }

//   // 4
//   @override
//   Widget build(BuildContext context) {
//     final routeBuilders = _routeBuilders(context);

//     return Navigator(
//       key: navigatorKey,
//       initialRoute: TabNavigatorRoutes.coffee,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) =>
//               routeBuilders[TabNavigatorRoutes.coffee]!(context),
//         );
//       },
//     );
//   }
// }
