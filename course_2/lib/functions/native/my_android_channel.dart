import 'package:flutter/material.dart';

class MyAndroidChannel extends StatefulWidget {
  const MyAndroidChannel({Key key}) : super(key: key);

  @override
  _MyAndroidChannelState createState() => _MyAndroidChannelState();
}

class _MyAndroidChannelState extends State<MyAndroidChannel> {
  final String _functionName = "Native Android";
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
