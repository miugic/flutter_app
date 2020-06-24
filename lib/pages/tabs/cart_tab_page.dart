import 'package:flutter/material.dart';

class CartTabPage extends StatefulWidget {
  @override
  _CartTabPageState createState() => _CartTabPageState();
}

class _CartTabPageState extends State<CartTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network("https://www.itying.com/images/flutter/2.png"),
        ));
  }
}
