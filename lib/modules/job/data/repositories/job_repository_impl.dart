import 'package:graphql_jobs/modules/job/data/data_sources/job_local_data_source.dart';
import 'package:graphql_jobs/modules/job/data/data_sources/job_remote_data_source.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_saved_key.dart';
import 'package:graphql_jobs/modules/job/domain/repositories/job_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: JobRepository)
class JobRepositoryImpl extends JobRepository {
  final JobRemoteDataSource _jobRemoteDataSource;
  final JobLocalDataSource _jobLocalDataSource;

  const JobRepositoryImpl(
    this._jobRemoteDataSource,
    this._jobLocalDataSource,
  );

  @override
  Future<List<Job>> getJobList() => _jobRemoteDataSource.getJobList();

  @override
  List<JobSavedKey> getFavoriteJobKeyList() =>
      _jobLocalDataSource.getSavedJobKeyList();

  @override
  Future<void> addSavedJob(JobSavedKey jobSavedKey) {
    // TODO: implement addSavedJob
    throw UnimplementedError();
  }

  @override
  Future<void> removeSavedJob(JobSavedKey jobSavedKey) {
    // TODO: implement removeSavedJob
    throw UnimplementedError();
  }
}
