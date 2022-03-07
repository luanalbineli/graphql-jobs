// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      title: json['title'] as String,
      applyUrl: json['applyUrl'] as String,
      locationNames: json['locationNames'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String,
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => JobTagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'title': instance.title,
      'applyUrl': instance.applyUrl,
      'locationNames': instance.locationNames,
      'createdAt': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'company': instance.company,
      'tags': instance.tags,
    };
