import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_saved_key.dart';

abstract class JobRepository {
  const JobRepository();

  Future<List<Job>> getJobList();

  List<JobSavedKey> getFavoriteJobKeyList();

  Future<void> removeSavedJob(JobSavedKey jobSavedKey);

  Future<void> addSavedJob(JobSavedKey jobSavedKey);
}
