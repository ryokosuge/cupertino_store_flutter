import 'package:cupertino_store_flutter/product_list_tab_page.dart';
import 'package:cupertino_store_flutter/search_tab_page.dart';
import 'package:cupertino_store_flutter/shopping_cart_tab_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoStoreApp extends StatelessWidget {
  const CupertinoStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  const CupertinoStoreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView tabView;
        switch (index) {
          case 0:
            tabView = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ProductListTabPage(),
                );
              },
            );
            break;
          case 1:
            tabView = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: SearchTabPage(),
                );
              },
            );
            break;
          case 2:
            tabView = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ShoppingCartTabPage(),
                );
              },
            );
            break;
        }

        return tabView;
      },
    );
  }
}
