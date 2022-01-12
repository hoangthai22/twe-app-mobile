import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/components/Search/tabNavigator.dart';
import 'package:twe/pages/AccountPage/acount_page.dart';
import 'package:twe/pages/HomePage/home_page.dart';
import 'package:provider/provider.dart';
import 'package:twe/provider/appProvider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.search;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
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
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.search) {
            // select 'main' tab
            _selectTab(TabItem.search);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigatorHome(TabItem.home),
          _buildOffstageNavigator(TabItem.search),
          _buildOffstageNavigatorAccout(
              TabItem.account, context.watch<AppProvider>().getUserId)
        ]),
        bottomNavigationBar: MenuFooter(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  Widget _buildOffstageNavigatorAccout(TabItem tabItem, userId) {
    return Offstage(
        offstage: _currentTab != tabItem,
        child: AccountPage(
          userId: userId,
        ));
  }

  Widget _buildOffstageNavigatorHome(TabItem tabItem) {
    return Offstage(offstage: _currentTab != tabItem, child: HomePage());
  }

  void onPushRouter() {}
}

enum TabItem { home, search, account }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.search: 'search',
  TabItem.account: 'account',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.search: Icons.search,
  TabItem.account: Icons.account_circle,
};
