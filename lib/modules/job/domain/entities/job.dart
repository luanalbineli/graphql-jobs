import 'package:equatable/equatable.dart';
import 'package:graphql_jobs/modules/job/domain/entities/company.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_tag.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job_key.dart';

class Job extends Equatable {
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

  SavedJobKey getJobSavedKey() => SavedJobKey(
        jobSlug: slug,
        companySlug: company.slug,
      );

  @override
  List<Object?> get props => [slug];
}
