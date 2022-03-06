import 'package:graphql_jobs/modules/job/data/data_sources/job_remote_data_source.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/repositories/job_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: JobRepository)
class JobRepositoryImpl extends JobRepository {
  final JobRemoteDataSource _jobRemoteDataSource;

  const JobRepositoryImpl(this._jobRemoteDataSource);

  @override
  Future<List<Job>> getJobList() => _jobRemoteDataSource.getJobList();
}
