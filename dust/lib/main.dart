import 'dart:convert';

import 'package:dust/constants.dart';
import 'package:dust/models/air_visual_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(App());
}

final String apiKey = "3afb2727-4549-495f-970c-102d1e2e19f8";

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
  AirResult? _result;

  Future<AirResult> fetchData() async {
    var response =
        await http.get(Uri.parse('${baseURL}v2/nearest_city?key=$apiKey'));

    return AirResult.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    fetchData().then((airResult) => {
          setState(() {
            _result = airResult;
          })
        });
    super.initState();
  }

  void handleRefresh() {
    print("refresh button clicked");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('re building\n');
    return Scaffold(
      appBar: AppBar(
        title: Text("Dust"),
      ),
      body: _result == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "현재 위치 미세먼지",
                        style: TextStyle(fontSize: 40),
                      ),
                      Card(
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            color: getColor(_result),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("얼굴사진"),
                                Text(
                                    "${_result?.data?.current?.pollution?.aqius}",
                                    style: TextStyle(fontSize: 40)),
                                Text("${getString(_result)}",
                                    style: TextStyle(fontSize: 20)),
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
                                    Image.network(
                                      'https://airvisual.com/images/${_result?.data?.current?.weather?.ic}.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                        "${_result?.data?.current?.weather?.tp} 도",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Text(
                                    "습도 ${_result?.data?.current?.weather?.hu} %"),
                                Text(
                                    "풍속 ${_result?.data?.current?.weather?.hu} m/s"),
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
                              (states) => EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 50),
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

  getColor(AirResult? result) {
    int? currentValue = result?.data?.current?.pollution?.aqius;
    if (currentValue! <= 50.0) {
      return Colors.blue;
    } else if (currentValue <= 50.0) {
      return Colors.green;
    } else if (currentValue <= 80.0) {
      return Colors.yellow;
    } else if (currentValue <= 100.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  getString(AirResult? result) {
    int? currentValue = result?.data?.current?.pollution?.aqius;
    if (currentValue! <= 50.0) {
      return "매우 좋음";
    } else if (currentValue <= 50.0) {
      return "좋음";
    } else if (currentValue <= 80.0) {
      return "보통";
    } else if (currentValue <= 100.0) {
      return "나쁨";
    } else {
      return "매우 나쁨";
    }
  }
}
