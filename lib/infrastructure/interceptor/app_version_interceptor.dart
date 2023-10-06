import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internship/infrastructure/singletons/app_version_singleton.dart';

@lazySingleton
class AppVersionInterceptor extends Interceptor {
  final AppVersionSingleton _singleton;

  AppVersionInterceptor(this._singleton);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.copyWith(
      headers: {
        ...options.headers,
        'X-App-Version': _singleton.appVersion,
      },
    );

    super.onRequest(options, handler);
  }
}
