import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(title: 'Counter App'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _simpleCounter = 0;
  int _rxdartCounter = 0;
  final counterSubject = BehaviorSubject<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: _increment, child: Text("Increase")),
            Text("$_simpleCounter"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              color: Colors.blueGrey,
              height: 2,
            ),
            TextButton(
                onPressed: () {
                  counterSubject.add(++_rxdartCounter);
                },
                child: Text("Increase RX")),
            StreamBuilder<int>(
              stream: counterSubject.stream,
              initialData: 0,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("error");
                } else if (snapshot.hasData) {
                  return Text("${snapshot.data}");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      _simpleCounter++;
    });
  }
}
