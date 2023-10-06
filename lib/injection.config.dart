// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internship/application/posts/posts_bloc.dart' as _i8;
import 'package:internship/application/view_post/view_post_bloc.dart' as _i6;
import 'package:internship/infrastructure/core/services_injectable_module.dart'
    as _i10;
import 'package:internship/infrastructure/interceptor/app_version_interceptor.dart'
    as _i9;
import 'package:internship/infrastructure/service/rest_client.dart' as _i5;
import 'package:internship/infrastructure/singletons/app_version_singleton.dart'
    as _i7;
import 'package:package_info_plus/package_info_plus.dart' as _i4;

const String _prod = 'prod';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final servicesInjectableModule = _$ServicesInjectableModule();
    gh.lazySingleton<_i3.Dio>(() => servicesInjectableModule.dio);
    await gh.lazySingletonAsync<_i4.PackageInfo>(
      () => servicesInjectableModule.packageInfo,
      preResolve: true,
    );
    gh.lazySingleton<_i5.RestClient>(
      () => servicesInjectableModule.client,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i5.RestClient>(
      () => servicesInjectableModule.mockClient,
      registerFor: {_test},
    );
    gh.factory<_i6.ViewPostBloc>(() => _i6.ViewPostBloc(gh<_i5.RestClient>()));
    gh.lazySingleton<_i7.AppVersionSingleton>(
        () => _i7.AppVersionSingleton(gh<_i4.PackageInfo>()));
    gh.factory<_i8.PostsBloc>(() => _i8.PostsBloc(gh<_i5.RestClient>()));
    gh.lazySingleton<_i9.AppVersionInterceptor>(
        () => _i9.AppVersionInterceptor(gh<_i7.AppVersionSingleton>()));
    return this;
  }
}

class _$ServicesInjectableModule extends _i10.ServicesInjectableModule {}
