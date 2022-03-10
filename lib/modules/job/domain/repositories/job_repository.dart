import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job_key.dart';

abstract class JobRepository {
  const JobRepository();

  Future<List<Job>> getJobList();

  List<SavedJobKey> getJobSavedKeyList();

  Future<void> removeSavedJob(SavedJobKey jobSavedKey);

  Future<void> addSavedJob(SavedJobKey jobSavedKey);

  Future<SavedJob> getSavedJob(SavedJobKey jobSavedKey);
}
