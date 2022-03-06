import 'package:graphql_jobs/modules/job/domain/entities/company.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_tag.dart';

class Job {
  final String title;
  final String applyUrl;
  final String? locationName;
  final Company company;
  final List<JobTag> tags;

  const Job({
    required this.title,
    required this.applyUrl,
    required this.locationName,
    required this.company,
    required this.tags,
  });
}
