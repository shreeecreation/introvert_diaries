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
import 'package:introvertdiaries/src/features/auth/domain/repository/auth_repository.dart'
    as _i1000;
import 'package:introvertdiaries/src/features/auth/presentation/blocs/login/login_cubit.dart'
    as _i814;
import 'package:introvertdiaries/src/features/auth/presentation/blocs/phonenumber/phone_number_cubit.dart'
    as _i567;
import 'package:introvertdiaries/src/features/auth/presentation/country_picker/cubit/get_country_picker_provider.dart'
    as _i636;

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
    gh.factory<_i567.PhoneNumberCubit>(() => _i567.PhoneNumberCubit());
    gh.singleton<_i195.AppRouter>(() => registerModules.router);
    gh.singleton<_i1054.SessionService>(() => _i1054.SessionService());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => registerModules.connectionChecker);
    gh.lazySingleton<_i1031.NetworkInfo>(
        () => _i1031.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i636.CountryInfoCubit>(
        () => _i636.CountryInfoCubit(gh<_i195.AppRouter>()));
    gh.lazySingleton<_i820.AuthInterceptor>(
        () => _i820.AuthInterceptor(gh<_i195.SessionService>()));
    gh.lazySingleton<_i361.Dio>(
        () => registerModules.dio(gh<_i978.AuthInterceptor>()));
    gh.lazySingleton<_i1000.AuthenticationRemoteSource>(
        () => _i1000.AuthenticationRemoteSourceImpl(
              gh<_i361.Dio>(),
              gh<_i195.NetworkInfo>(),
            ));
    gh.factory<_i814.LoginCubit>(
        () => _i814.LoginCubit(gh<_i1000.AuthenticationRemoteSource>()));
    return this;
  }
}

class _$RegisterModules extends _i534.RegisterModules {}
