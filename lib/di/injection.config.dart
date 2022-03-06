// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../modules/job/data/data_sources/job_remote_data_source.dart' as _i4;
import '../modules/job/data/repositories/job_repository_impl.dart' as _i6;
import '../modules/job/domain/repositories/job_repository.dart' as _i5;
import '../modules/job/domain/use_cases/get_job_list_use_case.dart' as _i7;
import '../modules/job/presentation/bloc/job_list_bloc.dart' as _i8;
import 'module/main_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final mainModule = _$MainModule();
  gh.factory<_i3.GraphQLClient>(() => mainModule.getGraphQLClient());
  gh.factory<_i4.JobRemoteDataSource>(
      () => _i4.EpisodeRemoteDataSourceImpl(get<_i3.GraphQLClient>()));
  gh.factory<_i5.JobRepository>(
      () => _i6.JobRepositoryImpl(get<_i4.JobRemoteDataSource>()));
  gh.factory<_i7.GetJobListUseCase>(
      () => _i7.GetJobListUseCase(get<_i5.JobRepository>()));
  gh.factory<_i8.JobListBloc>(
      () => _i8.JobListBloc(get<_i7.GetJobListUseCase>()));
  return get;
}

class _$MainModule extends _i9.MainModule {}
