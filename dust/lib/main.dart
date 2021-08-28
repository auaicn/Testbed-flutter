import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(App());
}

final String _key = "3afb2727-4549-495f-970c-102d1e2e19f8";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: GoogleFonts.acme().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void handleRefresh() {
    print("refresh button clicked");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dust"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("현재 위치 미세먼지"),
            Card(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("얼굴사진"),
                      Text("80", style: TextStyle(fontSize: 40)),
                      Text("보통", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text("이미지"),
                          SizedBox(
                            width: 16,
                          ),
                          Text("11도", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Text("습도 100 %"),
                      Text("풍속 5.7 m/s"),
                    ],
                  ),
                ),
              ]),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: TextButton(
                onPressed: handleRefresh,
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) =>
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.orange),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
                child: Icon(Icons.refresh),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
