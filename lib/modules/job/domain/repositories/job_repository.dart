import 'package:graphql_jobs/modules/job/domain/entities/job.dart';

abstract class JobRepository {
  const JobRepository();

  Future<List<Job>> getJobList();
}
