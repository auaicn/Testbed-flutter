import 'package:dust/bloc/air_bloc.dart';
import 'package:dust/models/air_visual_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dust/constants.dart';

final airBloc = AirBloc();

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dust',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dust"),
      ),
      body: StreamBuilder<AirResult>(
        stream: airBloc.air$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildBody(snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildBody(AirResult airResult) {
    var airQualityIndex = airResult.data?.current?.pollution?.aqius; // 대기질 지수
    var temperature = airResult.data?.current?.weather?.tp; // 온도
    var humidity = airResult.data?.current?.weather?.hu; // 습도
    var icon = airResult.data?.current?.weather?.ic; // 아이콘
    var windSpeed = airResult.data?.current?.weather?.ws; // 풍속

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "현재 위치 미세먼지",
            style: TextStyle(fontSize: 40),
          ),
          Card(
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                color: getBackgroundColor(airResult),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("얼굴사진"),
                    Text('$airQualityIndex', style: TextStyle(fontSize: 40)),
                    Text('${getAnnotationString(airResult)}',
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
                          '$baseURL$icon.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("$temperature 도", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Text("습도 $humidity %"),
                    Text("풍속 $windSpeed m/s"),
                  ],
                ),
              ),
            ]),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: TextButton(
              onPressed: airBloc.fetchData,
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith(
                  (states) =>
                      EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.orange),
                foregroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.white),
              ),
              child: Icon(Icons.refresh),
            ),
          )
        ]),
      ),
    );
  }

  Color getBackgroundColor(AirResult airResult) {
    int? currentValue = airResult.data?.current?.pollution?.aqius;
    if (currentValue! <= 30.0) {
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

  String getAnnotationString(AirResult airResult) {
    int? currentValue = airResult.data?.current?.pollution?.aqius;
    if (currentValue! <= 30.0) {
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
