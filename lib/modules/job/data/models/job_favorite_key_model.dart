import 'package:graphql_jobs/modules/job/domain/entities/job_saved_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_favorite_key_model.g.dart';

@JsonSerializable()
class JobSavedKeyModel extends JobSavedKey {
  JobSavedKeyModel({
    required String jobSlug,
    required String companySlug,
  }) : super(
          jobSlug: jobSlug,
          companySlug: companySlug,
        );

  factory JobSavedKeyModel.fromJson(Map<String, dynamic> json) =>
      _$JobSavedKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobSavedKeyModelToJson(this);
}
