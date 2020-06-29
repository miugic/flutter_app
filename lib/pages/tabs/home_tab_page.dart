import 'package:flutter/material.dart';
import 'package:fxapp/apis/goods_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  var categories = List();
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> params = {'page': 1, 'pageSize': 10};
    GoodsApi.recommend(params).then((res) {
      categories = [];
      var list = res['extra']['category'] as List;
      var len = list.length;
      if (len > 5) {
        for (var i = 0; i < len; i += 5) {
          categories.add(list.sublist(i, i + 5));
        }
      } else {
        categories.add(list);
      }
    }).catchError((err) {
      print(err);
    });
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
                          // print(currentIndex);
                          return Wrap(
                            runSpacing: 5,
                            children:
                                (categories[currentIndex] as List).map((item) {
                              return Container(child:
                                  LayoutBuilder(builder: (context, constrains) {
                                final double boxWidth = constrains.maxWidth / 5;
                                return Column(
                                  children: <Widget>[
                                    Container(
                                        width: boxWidth,
                                        child: Image(
                                            width: boxWidth * 0.8,
                                            height: boxWidth * 0.8,
                                            image: NetworkImage(
                                                item['categoryImgUrl']))),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6.0),
                                      child: new Text(item['categoryName']),
                                    )
                                  ],
                                );
                              }));
                            }).toList(),
                          );
                        },
                        loop: false,
                        onIndexChanged: (int index) {
                          print(index);
                          currentIndex = index;
                        },
                        itemCount: categories.length,
                        outer: true,
                        pagination: SwiperPagination(),
                      )),
                ])));
  }
}
