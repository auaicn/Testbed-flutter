import 'package:flutter/material.dart';

class ClassName extends StatefulWidget {
  const ClassName({Key key}) : super(key: key);

  @override
  _ClassNameState createState() => _ClassNameState();
}

class _ClassNameState extends State<ClassName> {
  final String _functionName = "function name";
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
