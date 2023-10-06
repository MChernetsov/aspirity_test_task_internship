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
import 'package:internship/application/posts/posts_bloc.dart' as _i6;
import 'package:internship/application/view_post/view_post_bloc.dart' as _i5;
import 'package:internship/infrastructure/core/services_injectable_module.dart'
    as _i7;
import 'package:internship/infrastructure/service/rest_client.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final servicesInjectableModule = _$ServicesInjectableModule();
    gh.lazySingleton<_i3.Dio>(() => servicesInjectableModule.dio);
    gh.factory<_i4.RestClient>(() => servicesInjectableModule.client);
    gh.factory<_i5.ViewPostBloc>(() => _i5.ViewPostBloc(gh<_i4.RestClient>()));
    gh.factory<_i6.PostsBloc>(() => _i6.PostsBloc(gh<_i4.RestClient>()));
    return this;
  }
}

class _$ServicesInjectableModule extends _i7.ServicesInjectableModule {}
