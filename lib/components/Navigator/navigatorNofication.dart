import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/components/app.dart';
import 'package:twe/pages/NoficationPage/nofication_page.dart';

class TabNavigatorRoutes {
  static const String nofication = '/nofication';
  // static const String coffeeDetail = '/coffee-detail';
}

// 2
class NavigatorNofication extends StatelessWidget {
  NavigatorNofication({
    required this.navigatorKey,
    required this.tabItem,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  // 3
  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
  ) {
    return {TabNavigatorRoutes.nofication: (context) => NoficationPage()};
  }

  // 4
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.nofication,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) =>
              routeBuilders[TabNavigatorRoutes.nofication]!(context),
        );
      },
    );
  }
}
