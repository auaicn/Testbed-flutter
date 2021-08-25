import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final String _functionName = "Drawer";
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
