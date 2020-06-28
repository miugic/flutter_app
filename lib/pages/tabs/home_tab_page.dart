import 'package:flutter/material.dart';
import 'package:fxapp/apis/goods_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> params = {'page': 1, 'pageSize': 10};
    GoodsApi.recommend(params)
        .then((res) => {print(res)})
        .catchError((err) => {print(err)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DEMO'),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Wrap(
                            runSpacing: 5,
                            children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                              return Container(child:
                                  LayoutBuilder(builder: (context, constrains) {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                        width: constrains.maxWidth / 5,
                                        height: constrains.maxWidth / 5,
                                        child: Image.asset(
                                            'assets/icon/no-results.png')),
                                  ],
                                );
                              }));
                            }).toList(),
                          );
                        },
                        itemCount: 10,
                      )),
                ])));
  }
}
