import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/components/app.dart';
import 'package:twe/pages/SearchPage/list_session_page.dart';

class TabNavigatorRoutes {
  static const String listSession = '/list-session';
  // static const String detail = '/detail';
  // static const String coffee = '/coffee';
  // static const String coffeeDetail = '/coffee-detail';
}

// 2
class NavigatorSessionList extends StatelessWidget {
  NavigatorSessionList({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  // 3
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int mentorId: 500}) {
    return {
      TabNavigatorRoutes.listSession: (context) => ListSessionPage(),
      // TabNavigatorRoutes.detail: (context) => MentorDetailPage(
      //       mentorId: mentorId,
      //       onPush: (materialIndex) => _pushListCafe(context, mentorId),
      //     ),
      // TabNavigatorRoutes.coffee: (context) => ListCoffeePage(
      //       coffeId: mentorId,
      //       onPush: (coffeeId) => _pushListCafeDetail(context, coffeeId),
      //       onRedirect: () => _pushListCafeDetail(context, 1),
      //     ),
      // TabNavigatorRoutes.coffeeDetail: (context) => CoffeeDetailPage(
      //       coffeeId: mentorId,
      //       onPush: (materialIndex) => _pushListCafeDetail(context, mentorId),
      //     ),
    };
  }

  // 4
  @override
  Widget build(BuildContext context) {
    print("contextSearch: $context");
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.listSession,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) =>
              routeBuilders[TabNavigatorRoutes.listSession]!(context),
        );
      },
    );
  }

  // 5
  // void _pushMentorDetail(BuildContext context, mentorId) {
  //   var routeBuilders = _routeBuilders(context, mentorId: mentorId);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           routeBuilders[TabNavigatorRoutes.detail]!(context),
  //     ),
  //   );
  // }

  // void _pushListCafe(BuildContext context, mentorId) {
  //   var routeBuilders = _routeBuilders(context, mentorId: mentorId);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           routeBuilders[TabNavigatorRoutes.coffee]!(context),
  //     ),
  //   );
  // }

  // void _pushListCafeDetail(BuildContext context, coffeeId) {
  //   var routeBuilders = _routeBuilders(context, mentorId: coffeeId);
  //   print("coffeeId: $coffeeId");
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           routeBuilders[TabNavigatorRoutes.coffeeDetail]!(context),
  //     ),
  //   );
  // }
}
