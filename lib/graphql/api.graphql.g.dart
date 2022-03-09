// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job$Query$Job$JobTag _$Job$Query$Job$JobTagFromJson(
        Map<String, dynamic> json) =>
    Job$Query$Job$JobTag()..name = json['name'] as String;

Map<String, dynamic> _$Job$Query$Job$JobTagToJson(
        Job$Query$Job$JobTag instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Job$Query$Job$Company _$Job$Query$Job$CompanyFromJson(
        Map<String, dynamic> json) =>
    Job$Query$Job$Company()
      ..name = json['name'] as String
      ..slug = json['slug'] as String
      ..websiteUrl = json['websiteUrl'] as String;

Map<String, dynamic> _$Job$Query$Job$CompanyToJson(
        Job$Query$Job$Company instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'websiteUrl': instance.websiteUrl,
    };

Job$Query$Job _$Job$Query$JobFromJson(Map<String, dynamic> json) =>
    Job$Query$Job()
      ..title = json['title'] as String
      ..applyUrl = json['applyUrl'] as String
      ..locationNames = json['locationNames'] as String?
      ..createdAt = json['createdAt'] as String
      ..description = json['description'] as String
      ..slug = json['slug'] as String
      ..tags = (json['tags'] as List<dynamic>)
          .map((e) => Job$Query$Job$JobTag.fromJson(e as Map<String, dynamic>))
          .toList()
      ..company = Job$Query$Job$Company.fromJson(
          json['company'] as Map<String, dynamic>);

Map<String, dynamic> _$Job$Query$JobToJson(Job$Query$Job instance) =>
    <String, dynamic>{
      'title': instance.title,
      'applyUrl': instance.applyUrl,
      'locationNames': instance.locationNames,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'slug': instance.slug,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'company': instance.company.toJson(),
    };

Job$Query _$Job$QueryFromJson(Map<String, dynamic> json) => Job$Query()
  ..job = Job$Query$Job.fromJson(json['job'] as Map<String, dynamic>);

Map<String, dynamic> _$Job$QueryToJson(Job$Query instance) => <String, dynamic>{
      'job': instance.job.toJson(),
    };

JobInput _$JobInputFromJson(Map<String, dynamic> json) => JobInput(
      jobSlug: json['jobSlug'] as String,
      companySlug: json['companySlug'] as String,
    );

Map<String, dynamic> _$JobInputToJson(JobInput instance) => <String, dynamic>{
      'jobSlug': instance.jobSlug,
      'companySlug': instance.companySlug,
    };

JobList$Query$Job$JobTag _$JobList$Query$Job$JobTagFromJson(
        Map<String, dynamic> json) =>
    JobList$Query$Job$JobTag()..name = json['name'] as String;

Map<String, dynamic> _$JobList$Query$Job$JobTagToJson(
        JobList$Query$Job$JobTag instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

JobList$Query$Job$Company _$JobList$Query$Job$CompanyFromJson(
        Map<String, dynamic> json) =>
    JobList$Query$Job$Company()
      ..name = json['name'] as String
      ..slug = json['slug'] as String
      ..websiteUrl = json['websiteUrl'] as String;

Map<String, dynamic> _$JobList$Query$Job$CompanyToJson(
        JobList$Query$Job$Company instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'websiteUrl': instance.websiteUrl,
    };

JobList$Query$Job _$JobList$Query$JobFromJson(Map<String, dynamic> json) =>
    JobList$Query$Job()
      ..title = json['title'] as String
      ..applyUrl = json['applyUrl'] as String
      ..locationNames = json['locationNames'] as String?
      ..createdAt = json['createdAt'] as String
      ..description = json['description'] as String
      ..slug = json['slug'] as String
      ..tags = (json['tags'] as List<dynamic>)
          .map((e) =>
              JobList$Query$Job$JobTag.fromJson(e as Map<String, dynamic>))
          .toList()
      ..company = JobList$Query$Job$Company.fromJson(
          json['company'] as Map<String, dynamic>);

Map<String, dynamic> _$JobList$Query$JobToJson(JobList$Query$Job instance) =>
    <String, dynamic>{
      'title': instance.title,
      'applyUrl': instance.applyUrl,
      'locationNames': instance.locationNames,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'slug': instance.slug,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'company': instance.company.toJson(),
    };

JobList$Query _$JobList$QueryFromJson(Map<String, dynamic> json) =>
    JobList$Query()
      ..jobs = (json['jobs'] as List<dynamic>)
          .map((e) => JobList$Query$Job.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$JobList$QueryToJson(JobList$Query instance) =>
    <String, dynamic>{
      'jobs': instance.jobs.map((e) => e.toJson()).toList(),
    };

JobArguments _$JobArgumentsFromJson(Map<String, dynamic> json) => JobArguments(
      input: JobInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobArgumentsToJson(JobArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };
