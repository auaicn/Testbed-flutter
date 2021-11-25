import 'package:flutter/material.dart';

class NormalPage extends StatelessWidget {
  const NormalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Normal Page'),
      ),
      body: Center(
        child: Container(
          width: 200,
          child: Text(
            'Material Page Route 를 통해 들어왔다면, 로그가 찍히지 않는 것을 확인할 수 있다.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
