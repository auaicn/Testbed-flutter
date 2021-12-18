import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({Key key}) : super(key: key);

  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  final String _functionName = "snack bar";
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
      body: Center(
        child: TextButton(
          child: Text("Show SnackBar"),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text("나는 스낵바"),
              action: SnackBarAction(label: '취소', onPressed: () {}),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
