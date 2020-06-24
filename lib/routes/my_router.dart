import 'package:flutter/cupertino.dart';
import 'package:fxapp/pages/tabs/home_tab_page.dart';
import 'package:fxapp/pages/tabs/cart_tab_page.dart';
import 'package:fxapp/pages/tabs/category_tab_page.dart';
import 'package:fxapp/pages/tabs/order_tab_page.dart';
import 'package:fxapp/pages/tabs/person_tab_page.dart';

class MyRouter {
  static Map<String, WidgetBuilder> get routes => {
        '/home': (context) => HomeTabPage(),
        '/category': (context) => CategoryTabPage(),
        '/cart': (context) => CartTabPage(),
        '/order': (context) => OrderTabPage(),
        '/person': (context) => PersonTabPage(),
      };
}
