import 'package:flutter/material.dart';

class OrderTabPage extends StatefulWidget {
  @override
  _OrderTabPageState createState() => _OrderTabPageState();
}

class _OrderTabPageState extends State<OrderTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('order'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network("https://www.itying.com/images/flutter/2.png"),
        ));
  }
}
