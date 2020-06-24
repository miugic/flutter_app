import 'package:flutter/material.dart';
import 'package:fxapp/apis/goods_api.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: Column(children: <Widget>[
          FlatButton(
            // ShapeBorder shape,
            // MaterialTapTargetSize materialTapTargetSize,
            onHighlightChanged: (isPress) {
              // 按钮按下，放开得过程
              print(isPress);
            },
            textTheme: ButtonTextTheme.primary, // 主题，可呗color覆盖
            textColor: Colors.blue,
            // 不可用 即： onPressed = null
            disabledTextColor: Colors.black, // 不可用时得颜色
            color: Colors.amber, // 背景色
            disabledColor: Colors.grey, // 不可用时 背景色
            highlightColor: Colors.red, // 按住后的颜色
            splashColor: Colors.white, // 点击时的按钮光圈颜色
            colorBrightness: Brightness.dark, // 好像没什么用。。。？？？
            padding: EdgeInsets.symmetric(vertical: 11, horizontal: 55),
            // 形状
            shape: RoundedRectangleBorder(
                // 圆角矩形边框
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                    style: BorderStyle.solid, color: Colors.blue, width: 2)),
            clipBehavior: Clip.hardEdge,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onPressed: () {
              Map<String, dynamic> params = {'page': 1, 'pageSize': 10};
              GoodsApi.recommend(params);
            },
            child: Text('FlatButton'),
          )
        ]));
  }
}
