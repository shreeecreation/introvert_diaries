// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:introvertdiaries/src/core/core.dart' as _i195;
import 'package:introvertdiaries/src/core/di/register_modules.dart' as _i534;
import 'package:introvertdiaries/src/core/interceptor/auth_interceptor.dart'
    as _i820;
import 'package:introvertdiaries/src/core/interceptor/interceptor.dart'
    as _i978;
import 'package:introvertdiaries/src/core/network/network_info.dart' as _i1031;
import 'package:introvertdiaries/src/core/session/session_service.dart'
    as _i1054;
import 'package:introvertdiaries/src/core/utils/permission_handler.dart'
    as _i597;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.factory<_i597.PermissionHandler>(() => _i597.PermissionHandler());
    gh.singleton<_i195.AppRouter>(() => registerModules.router);
    gh.singleton<_i1054.SessionService>(() => _i1054.SessionService());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => registerModules.connectionChecker);
    gh.lazySingleton<_i1031.NetworkInfo>(
        () => _i1031.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i820.AuthInterceptor>(
        () => _i820.AuthInterceptor(gh<_i195.SessionService>()));
    gh.lazySingleton<_i361.Dio>(
        () => registerModules.dio(gh<_i978.AuthInterceptor>()));
    return this;
  }
}

class _$RegisterModules extends _i534.RegisterModules {}
