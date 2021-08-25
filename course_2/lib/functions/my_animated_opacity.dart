import 'package:flutter/material.dart';

class MyAnimatedOpacity extends StatefulWidget {
  const MyAnimatedOpacity({Key key}) : super(key: key);

  @override
  _MyAnimatedOpacityState createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Opacity"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_visible ? Icons.toggle_on : Icons.toggle_off),
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
      ),
    );
  }
}
