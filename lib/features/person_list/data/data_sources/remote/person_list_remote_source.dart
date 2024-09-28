import 'package:dio/dio.dart';
import 'package:pdax_work_trial/common/exceptions/exceptions.dart';
import 'package:pdax_work_trial/core/constants/constants.dart';
import 'package:pdax_work_trial/core/dependency_injections/dependency_injections.dart';

class PersonListRemoteSource {
  Future<Response<dynamic>> fetchPersons() async {
    final dio = serviceLocator.get<Dio>();

    try {
      final response = await dio.get<Map<String, dynamic>>(
        ApiEndpoints.getPersons,
        queryParameters: {
          '_quantity': 70,
        },
      );

      return response;
    } on DioException catch (e) {
      throw GeneralException(
        e.message ?? '',
        e.response?.statusCode,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
