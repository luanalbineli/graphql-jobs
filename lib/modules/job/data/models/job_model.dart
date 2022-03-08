// ignore_for_file: overridden_fields

import 'package:graphql_jobs/modules/job/data/models/company_model.dart';
import 'package:graphql_jobs/modules/job/data/models/job_tag_model.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable()
class JobModel extends Job {
  @override
  final CompanyModel company;

  @override
  final List<JobTagModel> tags;

  const JobModel({
    required String title,
    required String applyUrl,
    String? locationNames,
    required DateTime createdAt,
    required String description,
    required String slug,
    required this.company,
    required this.tags,
  }) : super(
          title: title,
          applyUrl: applyUrl,
          locationNames: locationNames,
          createdAt: createdAt,
          description: description,
          slug: slug,
          company: company,
          tags: tags,
        );

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
