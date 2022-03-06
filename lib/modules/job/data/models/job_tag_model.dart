import 'package:graphql_jobs/modules/job/domain/entities/job_tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_tag_model.g.dart';

@JsonSerializable()
class JobTagModel extends JobTag {
  const JobTagModel({required String name}) : super(name: name);

  factory JobTagModel.fromJson(Map<String, dynamic> json) =>
      _$JobTagModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobTagModelToJson(this);
}
