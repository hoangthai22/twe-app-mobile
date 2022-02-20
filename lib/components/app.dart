import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/pages/AccountPage/acount_page.dart';
import 'package:twe/pages/HomePage/create_session_page.dart';
import 'package:twe/pages/HomePage/list_mentor_page.dart';
import 'package:twe/pages/HomePage/list_session_page.dart';
import 'package:twe/pages/HomePage/llist_cafe_page.dart';
import 'package:twe/pages/SearchPage/home_page.dart';
import 'package:twe/provider/appProvider.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.home;

  // Widget _buildOffstageNavigator(TabItem tabItem) {
  //   switch (tabItem) {
  //     case TabItem.home:
  //       return Offstage(
  //         offstage: _currentTab != tabItem,
  //         child: NavigatorSessionList(
  //           navigatorKey: _navigatorKeys[tabItem]!,
  //         ),
  //       );
  //     case TabItem.mentor:
  //       return Offstage(
  //         offstage: _currentTab != tabItem,
  //         child: NavigatorMentor(
  //           navigatorKey: _navigatorKeys[tabItem]!,
  //         ),
  //       );
  //     case TabItem.search:
  //       return Offstage(
  //         offstage: _currentTab != tabItem,
  //         child: NavigatorCreateSession(
  //           navigatorKey: _navigatorKeys[tabItem]!,
  //         ),
  //       );
  //     case TabItem.coffee:
  //       return Offstage(
  //         offstage: _currentTab != tabItem,
  //         child: NavigatorCoffee(
  //           navigatorKey: _navigatorKeys[tabItem]!,
  //         ),
  //       );
  //     case TabItem.account:
  //       return Offstage(
  //         offstage: _currentTab != tabItem,
  //         child: NavigatorSetting(
  //           navigatorKey: _navigatorKeys[tabItem]!,
  //         ),
  //       );
  //     default:
  //       return Offstage(
  //         offstage: _currentTab != tabItem,
  //         child: NavigatorSessionList(
  //           navigatorKey: _navigatorKeys[tabItem]!,
  //         ),
  //       );
  //   }
  // }

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.mentor: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.coffee: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      ListMentorPage(isMentorTab: true),
      const ListSessionPage(),
      ListCoffeePage(isCoffeeTab: true),
      AccountPage()
    ];

    return Consumer<AppProvider>(builder: (context, provider, child) {
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
              return true;
            }
          },
          child: Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: _widgetOptions.elementAt(_currentTab.index),
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
              )));
    });
  }
}

enum TabItem { home, mentor, search, coffee, account }

const Map<TabItem, String> tabName = {
  TabItem.home: 'Trang chủ',
  TabItem.mentor: 'Giảng viên',
  TabItem.search: 'Tìm kiếm',
  TabItem.coffee: 'Địa điểm',
  TabItem.account: 'Cài đặt',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.mentor: Icons.account_circle,
  TabItem.search: Icons.search,
  TabItem.coffee: Icons.coffee,
  TabItem.account: Icons.settings,
};
