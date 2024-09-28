import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setupServiceLocator() {
    getIt.registerSingleton<Dio>(Dio());
  }
}
