import 'package:flutter/material.dart';

class TutorialCoachMarkScreen extends StatelessWidget {
  final String title;
  const TutorialCoachMarkScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
