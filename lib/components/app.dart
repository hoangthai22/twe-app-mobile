import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/components/Navigator/navigatorCreateSession.dart';
import 'package:twe/components/Navigator/navigatorNofication.dart';
import 'package:twe/components/Navigator/navigatorSessionList.dart';
import 'package:twe/components/Navigator/navigatorSetting.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/pages/LoginPage/login_page.dart';
import 'package:twe/provider/appProvider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.home;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.nofication: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      print("main");
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
              // print("object 1");
              // final isFirstRouteInCurrentTab =
              //     !await _navigatorKeys[TabItem.home]!.currentState!.maybePop();
              // Navigator.pushNamed(context, '/login');
              return true;
            }
          },
          child: provider.getIsLogin
              ? Scaffold(
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Stack(children: <Widget>[
                      _buildOffstageNavigatorHome(TabItem.home),
                      _buildOffstageNavigator(TabItem.search),
                      _buildOffstageNavigatorNofication(TabItem.nofication),
                      _buildOffstageNavigatorAccount(TabItem.account)
                    ]),
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
                  ))
              : LoginPage());
    });
  }

  Widget _buildOffstageNavigatorHome(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: NavigatorCreateSession(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: NavigatorSessionList(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  Widget _buildOffstageNavigatorAccount(TabItem tabItem) {
    return Offstage(
        offstage: _currentTab != tabItem,
        child: NavigatorSetting(
          navigatorKey: _navigatorKeys[tabItem]!,
          tabItem: tabItem,
        ));
  }

  Widget _buildOffstageNavigatorNofication(TabItem tabItem) {
    return Offstage(
        offstage: _currentTab != tabItem,
        child: NavigatorNofication(
          navigatorKey: _navigatorKeys[tabItem]!,
          tabItem: tabItem,
        ));
  }
}

enum TabItem { home, search, nofication, account }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.nofication: 'nofication',
  TabItem.search: 'search',
  TabItem.account: 'account',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.nofication: Icons.notifications,
  TabItem.search: Icons.search,
  TabItem.account: Icons.account_circle,
};
