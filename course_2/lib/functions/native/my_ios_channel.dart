import 'package:flutter/material.dart';

class MyIOSChannel extends StatefulWidget {
  const MyIOSChannel({Key key}) : super(key: key);

  @override
  _MyIOSChannelState createState() => _MyIOSChannelState();
}

class _MyIOSChannelState extends State<MyIOSChannel> {
  final String _functionName = "Native iOS";
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
