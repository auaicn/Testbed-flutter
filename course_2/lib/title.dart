import 'package:course_2/my_animated_opacity.dart';
import 'package:flutter/material.dart';
import 'package:course_2/my_animated_container.dart';
import 'dart:math';

class TitlePage extends StatefulWidget {
  const TitlePage({Key key}) : super(key: key);

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Functions Title Page")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FunctionItem(
                  functionName: "Animated Container",
                  detailedWidget: MyAnimatedContainer(),
                ),
                FunctionItem(
                  functionName: "Animated Opacity",
                  detailedWidget: MyAnimatedOpacity(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FunctionItem extends StatelessWidget {
  const FunctionItem({this.functionName, this.detailedWidget}) : super();

  final String functionName;
  final Widget detailedWidget;

  Color _getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => _getRandomColor(),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailedWidget),
        );
      },
      child: Text(
        functionName,
        style: TextStyle(backgroundColor: Colors.white),
      ),
    );
  }
}
