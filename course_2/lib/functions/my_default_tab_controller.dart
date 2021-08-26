import 'package:flutter/material.dart';

class MyDefaultTabController extends StatefulWidget {
  const MyDefaultTabController({Key key}) : super(key: key);

  @override
  _MyDefaultTabControllerState createState() => _MyDefaultTabControllerState();
}

class _MyDefaultTabControllerState extends State<MyDefaultTabController> {
  final String _functionName = "Tab Controller using default Tab Controller";
  final int _numberOfTabs = 8;
  void _handleAppBarBackArrow() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _numberOfTabs,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _functionName,
            textScaleFactor: 0.5,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _handleAppBarBackArrow,
          ),
          bottom: TabBar(
            tabs: List.generate(
              _numberOfTabs,
              (index) => Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text("tab $index"),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            _numberOfTabs,
            (index) => Center(
              child: Text("tab $index"),
            ),
          ),
        ),
      ),
    );
  }
}
