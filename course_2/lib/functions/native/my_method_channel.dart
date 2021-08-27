import 'package:flutter/material.dart';

class MyMethodChannel extends StatefulWidget {
  const MyMethodChannel({Key key}) : super(key: key);

  @override
  _MyMethodChannelState createState() => _MyMethodChannelState();
}

class _MyMethodChannelState extends State<MyMethodChannel> {
  final String _functionName = "Native Flutter";
  void _handleAppBarBackArrow() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_functionName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _handleAppBarBackArrow,
        ),
      ),
      body: Container(color: Colors.white),
    );
  }
}
