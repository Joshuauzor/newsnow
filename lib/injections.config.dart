// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import 'core/network/network_info.dart' as _i5;
import 'features/features.dart' as _i7;
import 'features/home/data/datasources/news_remote_datasource.dart' as _i6;
import 'features/home/data/repositories/news_repositories_impl.dart' as _i8;
import 'features/home/domain/usecases/news_usecases.dart' as _i9;
import 'register_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i6.NewsRemoteDataSource>(() => _i6.NewsRemoteDataSourceImpl(
      networkInfo: get<_i5.NetworkInfo>(), dio: get<_i3.Dio>()));
  gh.lazySingleton<_i7.NewsRepository>(
      () => _i8.NewsRepositoryImpl(get<_i7.NewsRemoteDataSource>()));
  gh.lazySingleton<_i9.NewsUseCase>(
      () => _i9.NewsUseCase(get<_i7.NewsRepository>()));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
