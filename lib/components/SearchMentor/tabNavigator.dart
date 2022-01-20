import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/components/app.dart';
import 'package:twe/pages/SearchPage/coffee_detail_page.dart';
import 'package:twe/pages/SearchPage/llist_cafe_page.dart';
import 'package:twe/pages/SearchPage/mentor_detail_page.dart';
import 'package:twe/pages/SearchPage/search_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
  static const String coffee = '/coffee';
  static const String coffeeDetail = '/coffee-detail';
}

// 2
class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  // 3
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int mentorId: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => SearchPage(
            onPush: (mentorId) => _pushMentorDetail(context, mentorId),
          ),
      TabNavigatorRoutes.detail: (context) => MentorDetailPage(
            mentorId: mentorId,
            materialIndex: mentorId,
            onPush: (materialIndex) => _pushListCafe(context, mentorId),
          ),
      TabNavigatorRoutes.coffee: (context) => ListCoffeePage(
            mentorId: mentorId,
            onPush: (coffeeId) => _pushListCafeDetail(context, coffeeId),
          ),
      TabNavigatorRoutes.coffeeDetail: (context) => CoffeeDetailPage(
            coffeeId: mentorId,
            onPush: (materialIndex) => _pushListCafeDetail(context, mentorId),
          ),
    };
  }

  // 4
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }

  // 5
  void _pushMentorDetail(BuildContext context, mentorId) {
    var routeBuilders = _routeBuilders(context, mentorId: mentorId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.detail]!(context),
      ),
    );
  }

  void _pushListCafe(BuildContext context, mentorId) {
    var routeBuilders = _routeBuilders(context, mentorId: mentorId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.coffee]!(context),
      ),
    );
  }

  void _pushListCafeDetail(BuildContext context, coffeeId) {
    var routeBuilders = _routeBuilders(context, mentorId: coffeeId);
    print("coffeeId: $coffeeId");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.coffeeDetail]!(context),
      ),
    );
  }
}
