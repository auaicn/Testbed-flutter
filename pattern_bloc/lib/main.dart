import 'package:bloc_pattern/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

final counterBloc = CounterBloc();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(title: 'Bloc Pattern'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: counterBloc.increase, child: Text('increase')),
              StreamBuilder(
                stream: counterBloc.counter$,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('error');
                  } else if (snapshot.hasData) {
                    return Text('${snapshot.data}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
