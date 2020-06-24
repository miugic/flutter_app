import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fxapp/pages/tabs/cart_tab_page.dart';
import 'package:fxapp/pages/tabs/category_tab_page.dart';
import 'package:fxapp/pages/tabs/home_tab_page.dart';
import 'package:fxapp/pages/tabs/order_tab_page.dart';
import 'package:fxapp/pages/tabs/person_tab_page.dart';
import 'package:fxapp/routes/my_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = MyRouter.routes;

    return MaterialApp(
      title: 'fxapp',
      routes: routes,
      debugShowCheckedModeBanner: false, // 开发环境删除右上角角标
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff1f9792),
        accentColor: Color(0xff1f9792),
        backgroundColor: Color(0xfff5f5f5),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _bottomNavigationBarItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(title: new Text("首页"), icon: new Icon(Icons.home)),
    BottomNavigationBarItem(
        title: new Text("分类"), icon: new Icon(Icons.view_list)),
    BottomNavigationBarItem(
        title: new Text("购物车"), icon: new Icon(Icons.shopping_cart)),
    BottomNavigationBarItem(
        title: new Text("订单"), icon: new Icon(Icons.assignment)),
    BottomNavigationBarItem(title: new Text("个人"), icon: new Icon(Icons.person))
  ];
  final List<Widget> pageList = [
    HomeTabPage(),
    CategoryTabPage(),
    CartTabPage(),
    OrderTabPage(),
    PersonTabPage()
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          inactiveColor: Color(0xff6e6e6e),
          activeColor: Color(0xff1f9792),
          items: _bottomNavigationBarItems,
          onTap: (val) {
            setState(() {
              _currentIndex = val;
            });
          }),
      body: pageList[_currentIndex],
      backgroundColor: Colors.white, // 脚手架背景色
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      primary: true, // 头部会变
    );
  }
}
