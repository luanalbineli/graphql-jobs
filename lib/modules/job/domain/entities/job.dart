import 'package:graphql_jobs/modules/job/domain/entities/company.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_saved_key.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_tag.dart';

class Job {
  final String title;
  final String applyUrl;
  final String? locationNames;
  final DateTime createdAt;
  final String description;
  final String slug;
  final Company company;
  final List<JobTag> tags;

  const Job({
    required this.title,
    required this.applyUrl,
    this.locationNames,
    required this.description,
    required this.slug,
    required this.createdAt,
    required this.company,
    required this.tags,
  });

  JobSavedKey getJobSavedKey() => JobSavedKey(
        jobSlug: slug,
        companySlug: company.slug,
      );

  @override
  bool operator ==(Object other) => other is Job && slug == other.slug;

  @override
  int get hashCode => slug.hashCode;
}
