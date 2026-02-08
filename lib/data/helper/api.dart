import 'package:dio/dio.dart';

class Api {
  Future<dynamic> get({required String url, dynamic token}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (e) {


     return 'Failed to load data status code: ${e.response?.statusCode} - ${e.message}';
    }
  }
}
