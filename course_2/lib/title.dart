import 'package:flutter/material.dart';
import 'package:course_2/MyAnimatedContainer.dart';

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
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyAnimatedContainer(),
                        ),
                      );
                    },
                    child: Text("Animated Container"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
