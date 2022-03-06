import 'package:graphql_jobs/modules/job/domain/entities/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends Company {
  const CompanyModel({required String name, required String websiteUrl})
      : super(name: name, websiteUrl: websiteUrl);

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
