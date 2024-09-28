import 'package:dio/dio.dart';
import 'package:pdax_work_trial/core/constants/api_endpoints.dart';

class PersonListRemoteSource {
  static Future<Response<dynamic>> fetchPersons() async {
    Dio dio = Dio();

    try {
      final response = await dio.get(ApiEndpoints.getPersons);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
