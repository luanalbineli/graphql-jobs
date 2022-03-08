// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../modules/job/data/data_sources/job_local_data_source.dart' as _i7;
import '../modules/job/data/data_sources/job_remote_data_source.dart' as _i5;
import '../modules/job/data/repositories/job_repository_impl.dart' as _i9;
import '../modules/job/domain/repositories/job_repository.dart' as _i8;
import '../modules/job/domain/use_cases/get_job_list_use_case.dart' as _i11;
import '../modules/job/domain/use_cases/toggle_job_saved.dart' as _i10;
import '../modules/job/presentation/bloc/job_list_bloc.dart' as _i12;
import '../modules/job/presentation/bloc/save_job_bloc.dart' as _i13;
import 'module/environment_config.dart' as _i3;
import 'module/main_module.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final mainModule = _$MainModule();
  gh.factory<_i3.EnvironmentConfig>(() => mainModule.environmentConfig);
  gh.factory<_i4.GraphQLClient>(() => mainModule.getGraphQLClient());
  gh.factory<_i5.JobRemoteDataSource>(
      () => _i5.JobRemoteDataSourceImpl(get<_i4.GraphQLClient>()));
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => mainModule.sharedPreferences,
      preResolve: true);
  gh.factory<_i7.JobLocalDataSource>(
      () => _i7.JobLocalDataSourceImpl(get<_i6.SharedPreferences>()));
  gh.factory<_i8.JobRepository>(() => _i9.JobRepositoryImpl(
      get<_i5.JobRemoteDataSource>(), get<_i7.JobLocalDataSource>()));
  gh.factory<_i10.ToggleJobSavedUseCase>(
      () => _i10.ToggleJobSavedUseCase(get<_i8.JobRepository>()));
  gh.factory<_i11.GetJobListUseCase>(
      () => _i11.GetJobListUseCase(get<_i8.JobRepository>()));
  gh.factory<_i12.JobListBloc>(
      () => _i12.JobListBloc(get<_i11.GetJobListUseCase>()));
  gh.factory<_i13.SaveJobBloc>(
      () => _i13.SaveJobBloc(get<_i10.ToggleJobSavedUseCase>()));
  return get;
}

class _$MainModule extends _i14.MainModule {}
