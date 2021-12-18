import 'package:flutter/cupertino.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            MaterialButton(
              child: Text(
                "Cupertino date Picker",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.redAccent,
              onPressed: () {
                showCupertinoDatePicker(context);
              },
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(children: [
                      Container(height: 120.0, color: Colors.yellow),
                      Container(height: 100.0, color: Colors.cyan),
                    ]),
                  ),
                  Expanded(child: Container(color: Colors.amber)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showCupertinoDatePicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 32,
              padding: EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  '확인',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoDatePicker(
                minimumYear: 1900,
                maximumYear: DateTime.now().year,
                initialDateTime: DateTime(DateTime.now().year - 4),
                maximumDate: DateTime.now(),
                onDateTimeChanged: onDateTimeChanged,
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          ],
        );
      },
    );
  }

  void onDateTimeChanged(DateTime dateTime) {
    print(dateTime);
  }
}
