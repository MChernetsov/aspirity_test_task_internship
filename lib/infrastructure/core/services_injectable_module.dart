import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:internship/infrastructure/service/rest_client.dart';

@module
abstract class ServicesInjectableModule {
  @lazySingleton
  Dio get dio => Dio();

  RestClient get client => RestClient(dio);
}
