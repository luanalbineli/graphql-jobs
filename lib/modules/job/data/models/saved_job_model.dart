import 'package:graphql_jobs/modules/job/domain/entities/saved_job_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_job_model.g.dart';

@JsonSerializable()
class SavedJobKeyModel extends SavedJobKey {
  const SavedJobKeyModel({
    required String jobSlug,
    required String companySlug,
  }) : super(
          jobSlug: jobSlug,
          companySlug: companySlug,
        );

  factory SavedJobKeyModel.fromJson(Map<String, dynamic> json) =>
      _$SavedJobKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedJobKeyModelToJson(this);
}
