import 'dart:convert';
import 'package:http/http.dart' as hhtp;
import 'package:http/http.dart' as http;
class Api{
Future<dynamic> get({required String url, dynamic token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authozrization': 'Bearer $token'});
    }
    http.Response response = await hhtp.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to load data status code: ${response.statusCode}',
      );
    }
  }
}