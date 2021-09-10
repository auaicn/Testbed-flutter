import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        accentColor: Colors.black,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreeen(),
    );
  }
}

class MainScreeen extends StatelessWidget {
  const MainScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'headline1',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'headline2',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            'headline3',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            'headline4',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'headline5',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'headline6',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'bodyText1',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'bodyText2',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            'subtitle1',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'subtitle2',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
