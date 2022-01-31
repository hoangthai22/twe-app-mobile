import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/app.dart';
import 'package:twe/pages/AccountPage/acount_page.dart';
import 'package:twe/pages/AccountPage/feedback_session_page.dart';
import 'package:twe/pages/AccountPage/hisory_page.dart';
import 'package:twe/pages/AccountPage/history_detail_page.dart';
import 'package:twe/pages/AccountPage/my_session.dart';
import 'package:twe/pages/AccountPage/profile_page.dart';
import 'package:twe/pages/SearchPage/list_session_page.dart';

class TabNavigatorRoutes {
  static const String setting = '/setting';
  static const String sessions = '/my-session';
  static const String history = '/history';
  static const String profile = '/profile';
  static const String historyDetail = '/history-detail';
  static const String feedbackSession = '/feedback-session';
}

// 2
class NavigatorSetting extends StatelessWidget {
  NavigatorSetting({
    required this.navigatorKey,
    required this.tabItem,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  // 3
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, {historyId}) {
    return {
      TabNavigatorRoutes.setting: (context) => AccountPage(
          onPush: (settingCondition) =>
              _pushRedirect(context, settingCondition)),
      TabNavigatorRoutes.sessions: (context) => MySession(),
      TabNavigatorRoutes.history: (context) => HistoryPage(
            onPush: (historyId) => _pushHistoryDetail(context, historyId),
          ),
      TabNavigatorRoutes.profile: (context) => ProfilePage(),
      TabNavigatorRoutes.historyDetail: (context) => HistoryDetailPage(
          historyId: historyId,
          onPush: () => _pushFeedbackSession(context, historyId)),
      TabNavigatorRoutes.feedbackSession: (context) => FeedbackSessionPage(
            historyId: historyId,
          ),
    };
  }

  // 4
  @override
  Widget build(BuildContext context) {
    print("contextSearch: $context");
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.setting,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) =>
              routeBuilders[TabNavigatorRoutes.setting]!(context),
        );
      },
    );
  }

  // 5
  void _pushRedirect(BuildContext context, settingCondition) {
    var routeBuilders = _routeBuilders(context);
    // if (settingCondition == btnSetting[ButtonSetting.logout].toString()) {
    //   // Navigator.of(context).popUntil((route) => route.isFirst);
    //   // onPush();
    // } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        if (settingCondition == btnSetting[ButtonSetting.sessions].toString()) {
          return routeBuilders[TabNavigatorRoutes.sessions]!(context);
        } else if (settingCondition ==
            btnSetting[ButtonSetting.history].toString()) {
          return routeBuilders[TabNavigatorRoutes.history]!(context);
        } else {
          return routeBuilders[TabNavigatorRoutes.profile]!(context);
        }
      }),
    );
    // }
  }

  void _pushHistoryDetail(BuildContext context, historyId) {
    var routeBuilders = _routeBuilders(context, historyId: historyId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.historyDetail]!(context),
      ),
    );
  }

  void _pushFeedbackSession(BuildContext context, historyId) {
    var routeBuilders = _routeBuilders(context, historyId: historyId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.feedbackSession]!(context),
      ),
    );
  }
}
