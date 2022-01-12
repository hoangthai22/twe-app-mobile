import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/components/app.dart';
import 'package:twe/pages/AccountPage/acount_page.dart';
import 'package:twe/pages/SearchPage/search_page.dart';

class MenuFooter extends StatefulWidget implements PreferredSizeWidget {
  @override
  _MenuFooter createState() => _MenuFooter();
  late final TabItem currentTab;
  late final ValueChanged<TabItem> onSelectTab;

  MenuFooter({required this.currentTab, required this.onSelectTab});
  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MenuFooter extends State<MenuFooter> {
  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(tabIcon[tabItem]),
      label: tabName[tabItem],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentTab.index,
      selectedItemColor: Colors.amber[800],
      items: [
        _buildItem(TabItem.home),
        _buildItem(TabItem.search),
        _buildItem(TabItem.account),
      ],
      onTap: (index) => widget.onSelectTab(
        TabItem.values[index],
      ),
    );
  }
}

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
  static const String account = '/account';
}
