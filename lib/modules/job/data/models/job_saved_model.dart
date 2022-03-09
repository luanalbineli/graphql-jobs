import 'package:graphql_jobs/modules/job/data/models/job_model.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_savedd.dart';

class JobSavedModel extends JobSaved {
  JobSavedModel({required JobModel jobModel}) : super(job: jobModel);
}
