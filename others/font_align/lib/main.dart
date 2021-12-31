import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.orange.shade100),
      home: MyHomePage(title: 'Text Widget leading Distribution'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          width: screenWidth * 0.8,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  color: Colors.red.shade100,
                  child: const Text(
                    'Hello, world!',
                    style: TextStyle(
                      fontSize: 40,
                      height: 2,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  color: Colors.blue.shade100,
                  child: const Text(
                    'Hello, world!',
                    style: TextStyle(
                      fontSize: 40,
                      height: 2,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
