import 'dart:convert';
import 'package:dust/constants.dart';
import 'package:dust/models/air_visual_result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class AirBloc {
  final airSubject = BehaviorSubject<AirResult>();
  Stream<AirResult> get air$ => airSubject.stream;

  AirBloc() {
    fetch();
  }

  void fetch() async {
    var airResult = await fetchData();
    airSubject.add(airResult);
  }

  Future<AirResult> fetchData() async {
    var response =
        await http.get(Uri.parse('${baseAPIURL}v2/nearest_city?key=$apiKey'));

    return AirResult.fromJson(json.decode(response.body));
  }
}
