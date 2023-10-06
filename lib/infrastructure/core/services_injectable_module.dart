import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:internship/infrastructure/core/mock_rest_client.dart';
import 'package:internship/infrastructure/interceptor/app_version_interceptor.dart';
import 'package:internship/infrastructure/service/rest_client.dart';
import 'package:internship/infrastructure/singletons/app_version_singleton.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class ServicesInjectableModule {
  @lazySingleton
  Dio get dio {
    final appVersionSingleton = GetIt.instance<AppVersionSingleton>();
    return Dio()
      ..interceptors.addAll([
        AppVersionInterceptor(appVersionSingleton),
      ]);
  }

  @LazySingleton(env: [Environment.prod])
  RestClient get client => RestClient(dio);

  @LazySingleton(env: [Environment.test])
  RestClient get mockClient => MockRestClient();

  @preResolve
  @lazySingleton
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}
