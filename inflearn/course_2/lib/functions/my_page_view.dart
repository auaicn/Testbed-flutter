import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key key}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
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
      body: PageView(children: [
        Center(child: Text("1")),
        Center(child: Text("2")),
        Center(child: Text("3")),
        Center(child: Text("4")),
      ]),
    );
  }
}
