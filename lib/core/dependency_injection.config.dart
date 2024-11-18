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
import 'package:kindred_mobile/common/utils/date_time_util.dart' as _i262;
import 'package:kindred_mobile/core/data/api/api_module.dart' as _i837;
import 'package:kindred_mobile/core/infrastructure/environment/environment_module.dart'
    as _i502;
import 'package:kindred_mobile/core/infrastructure/environment/environment_variables.dart'
    as _i501;
import 'package:kindred_mobile/core/infrastructure/platform/platform_module.dart'
    as _i886;
import 'package:kindred_mobile/core/infrastructure/storage/keychain_service.dart'
    as _i977;
import 'package:kindred_mobile/core/infrastructure/storage/shared_prefs_service.dart'
    as _i467;
import 'package:kindred_mobile/features/app/presentation/bloc/app_bloc.dart'
    as _i350;
import 'package:kindred_mobile/features/products/data/data_sources/remote/product_api_service.dart'
    as _i797;
import 'package:kindred_mobile/features/products/data/repository/product_repository.dart'
    as _i272;
import 'package:kindred_mobile/features/products/domain/repository/product_repository.dart'
    as _i692;
import 'package:kindred_mobile/features/products/domain/usecases/get_product_use_case.dart'
    as _i1063;
import 'package:kindred_mobile/features/products/domain/usecases/get_productlist_use_case.dart'
    as _i361;
import 'package:kindred_mobile/features/products/presentation/bloc/product_list/product_list_bloc.dart'
    as _i763;
import 'package:kindred_mobile/features/products/presentation/bloc/single_product/singe_product_bloc.dart'
    as _i759;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $register(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final platformModule = _$PlatformModule();
  final environmentModule = _$EnvironmentModule();
  final apiModule = _$ApiModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => platformModule.sharedPrefs,
    preResolve: true,
  );
  gh.lazySingleton<_i974.Logger>(() => environmentModule.logger());
  gh.lazySingleton<_i152.LocalAuthentication>(() => platformModule.localAuth);
  gh.lazySingleton<_i467.SharedPrefsService>(
      () => _i467.SharedPrefServiceImpl(gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i977.KeychainService>(() => _i977.KeychainServiceImpl());
  gh.lazySingleton<_i262.DateTimeUtil>(() => _i262.DateTimeUtilImpl());
  gh.factory<_i350.AppBloc>(() => _i350.AppBloc(
        gh<_i977.KeychainService>(),
        gh<_i467.SharedPrefsService>(),
      ));
  gh.lazySingleton<_i501.EnvironmentVariables>(
      () => _i501.EnvironmentVariablesImpl());
  gh.lazySingleton<String>(
    () => environmentModule.getAppUrl(gh<_i501.EnvironmentVariables>()),
    instanceName: 'appUrl',
  );
  gh.factory<_i361.Dio>(() => apiModule.createDio(
        gh<_i974.Logger>(),
        gh<String>(instanceName: 'appUrl'),
      ));
  gh.lazySingleton<_i797.ProductsApiService>(
      () => _i797.ProductsApiService(gh<_i361.Dio>()));
  gh.lazySingleton<_i692.ProductRepository>(
      () => _i272.ProductRepositoryImpl(gh<_i797.ProductsApiService>()));
  gh.lazySingleton<_i361.GetProductListUseCase>(
      () => _i361.GetProductListUseCase(gh<_i692.ProductRepository>()));
  gh.lazySingleton<_i1063.GetProductUseCase>(
      () => _i1063.GetProductUseCase(gh<_i692.ProductRepository>()));
  gh.factory<_i759.SingleProductBloc>(
      () => _i759.SingleProductBloc(gh<_i1063.GetProductUseCase>()));
  gh.factory<_i763.ProductListBloc>(
      () => _i763.ProductListBloc(gh<_i361.GetProductListUseCase>()));
  return getIt;
}

class _$PlatformModule extends _i886.PlatformModule {}

class _$EnvironmentModule extends _i502.EnvironmentModule {}

class _$ApiModule extends _i837.ApiModule {}
