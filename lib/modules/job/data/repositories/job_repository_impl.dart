import 'package:graphql_jobs/modules/job/data/data_sources/job_local_data_source.dart';
import 'package:graphql_jobs/modules/job/data/data_sources/job_remote_data_source.dart';
import 'package:graphql_jobs/modules/job/data/models/saved_job_model.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job_key.dart';
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
  List<SavedJobKey> getJobSavedKeyList() =>
      _jobLocalDataSource.getSavedJobKeyList();

  @override
  Future<void> addSavedJob(SavedJobKey jobSavedKey) =>
      _jobLocalDataSource.addSavedJob(
        SavedJobKeyModel(
          jobSlug: jobSavedKey.jobSlug,
          companySlug: jobSavedKey.companySlug,
        ),
      );

  @override
  Future<void> removeSavedJob(SavedJobKey jobSavedKey) =>
      _jobLocalDataSource.removeSavedJob(
        SavedJobKeyModel(
          jobSlug: jobSavedKey.jobSlug,
          companySlug: jobSavedKey.companySlug,
        ),
      );

  @override
  Future<SavedJob> getSavedJob(SavedJobKey jobSavedKey) =>
      _jobRemoteDataSource.getSavedJob(
        SavedJobKeyModel(
          jobSlug: jobSavedKey.jobSlug,
          companySlug: jobSavedKey.companySlug,
        ),
      );
}
