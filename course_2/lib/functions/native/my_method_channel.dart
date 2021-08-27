import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  static const platform = const MethodChannel('example.com/value');
  String _value = 'null';

  Future<void> _getNativeValue() async {
    String value;
    try {
      value = await platform.invokeMethod('getValue');
    } on PlatformException catch (e) {
      value = '네이티브 코드 실행 에러 : ${e.message}';
    }
    setState(() {
      _value = value;
    });
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
        child: Column(
          children: [
            Text('$_value'),
            TextButton(
              onPressed: _getNativeValue,
              child: Text('네이티브 값 얻기'),
            ),
          ],
        ),
      ),
    );
  }
}
