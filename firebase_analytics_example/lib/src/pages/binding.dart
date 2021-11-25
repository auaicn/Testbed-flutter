import 'package:flutter/material.dart';

class BindingPage extends StatelessWidget {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binding'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Get X Binding'),
          ],
        ),
      ),
    );
  }
}
