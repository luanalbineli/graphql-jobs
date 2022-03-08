import 'package:graphql_jobs/modules/job/data/data_sources/job_local_data_source.dart';
import 'package:graphql_jobs/modules/job/data/data_sources/job_remote_data_source.dart';
import 'package:graphql_jobs/modules/job/data/models/job_favorite_key_model.dart';
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
  List<JobSavedKey> getJobSavedKeyList() =>
      _jobLocalDataSource.getSavedJobKeyList();

  @override
  Future<void> addSavedJob(JobSavedKey jobSavedKey) =>
      _jobLocalDataSource.addSavedJob(
        JobSavedKeyModel(
          jobSlug: jobSavedKey.jobSlug,
          companySlug: jobSavedKey.companySlug,
        ),
      );

  @override
  Future<void> removeSavedJob(JobSavedKey jobSavedKey) =>
      _jobLocalDataSource.removeSavedJob(
        JobSavedKeyModel(
          jobSlug: jobSavedKey.jobSlug,
          companySlug: jobSavedKey.companySlug,
        ),
      );
}
