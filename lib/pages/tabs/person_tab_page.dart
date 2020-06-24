import 'package:flutter/material.dart';

class PersonTabPage extends StatefulWidget {
  @override
  _PersonTabPageState createState() => _PersonTabPageState();
}

class _PersonTabPageState extends State<PersonTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('person'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network("https://www.itying.com/images/flutter/2.png"),
        ));
  }
}
