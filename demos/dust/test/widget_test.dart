import 'package:dust/models/air_visual_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseURL = 'http://api.airvisual.com/';

void main() {
  test('http 통신 테스트', () async {
    var response = await http.get(Uri.parse(
        '${baseURL}v2/nearest_city?key=3afb2727-4549-495f-970c-102d1e2e19f8'));

    expect(response.statusCode, 200);

    AirResult result = AirResult.fromJson(json.decode(response.body));

    expect(result.status, 'success');
  });
}
