import 'package:flutter/material.dart';

class CategoryTabPage extends StatefulWidget {
  @override
  _CategoryTabPageState createState() => _CategoryTabPageState();
}

class _CategoryTabPageState extends State<CategoryTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('category'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network("https://www.itying.com/images/flutter/2.png"),
        ));
  }
}
