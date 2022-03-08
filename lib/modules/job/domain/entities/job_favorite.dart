import 'package:graphql_jobs/modules/job/domain/entities/job.dart';

class JobFavorite {
  final Job job;
  final bool isSaved;

  JobFavorite({required this.job, required this.isSaved});
}
