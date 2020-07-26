import 'package:flutter/material.dart';

class DenemeView extends StatefulWidget {
  DenemeView({Key key}) : super(key: key);

  @override
  _DenemeViewState createState() => _DenemeViewState();
}

class _DenemeViewState extends State<DenemeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[],
      )),
    );
  }
}
