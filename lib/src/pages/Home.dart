import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import './ProfileTab.dart';
import './PogressTab.dart';
import 'product_list_tab.dart';
import 'SearchTab.dart';
import 'shoppingCartTab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text('Products')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart), title: Text('Cart')),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: ProductListTab());
              },
            );
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: SearchTab());
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: ShoppingCartTab());
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}
