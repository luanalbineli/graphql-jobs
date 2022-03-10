import 'package:graphql_jobs/modules/job/data/models/job_model.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job.dart';

class SavedJobModel extends SavedJob {
  SavedJobModel({required JobModel jobModel}) : super(job: jobModel);
}
