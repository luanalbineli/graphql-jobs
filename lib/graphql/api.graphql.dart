// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class JobList$Query$Job$JobTag extends JsonSerializable with EquatableMixin {
  JobList$Query$Job$JobTag();

  factory JobList$Query$Job$JobTag.fromJson(Map<String, dynamic> json) =>
      _$JobList$Query$Job$JobTagFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$JobList$Query$Job$JobTagToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobList$Query$Job$Company extends JsonSerializable with EquatableMixin {
  JobList$Query$Job$Company();

  factory JobList$Query$Job$Company.fromJson(Map<String, dynamic> json) =>
      _$JobList$Query$Job$CompanyFromJson(json);

  late String name;

  late String slug;

  late String websiteUrl;

  @override
  List<Object?> get props => [name, slug, websiteUrl];
  @override
  Map<String, dynamic> toJson() => _$JobList$Query$Job$CompanyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobList$Query$Job extends JsonSerializable with EquatableMixin {
  JobList$Query$Job();

  factory JobList$Query$Job.fromJson(Map<String, dynamic> json) =>
      _$JobList$Query$JobFromJson(json);

  late String title;

  late String applyUrl;

  String? locationNames;

  late String createdAt;

  late String description;

  late String slug;

  late List<JobList$Query$Job$JobTag> tags;

  late JobList$Query$Job$Company company;

  @override
  List<Object?> get props => [
        title,
        applyUrl,
        locationNames,
        createdAt,
        description,
        slug,
        tags,
        company
      ];
  @override
  Map<String, dynamic> toJson() => _$JobList$Query$JobToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobList$Query extends JsonSerializable with EquatableMixin {
  JobList$Query();

  factory JobList$Query.fromJson(Map<String, dynamic> json) =>
      _$JobList$QueryFromJson(json);

  late List<JobList$Query$Job> jobs;

  @override
  List<Object?> get props => [jobs];
  @override
  Map<String, dynamic> toJson() => _$JobList$QueryToJson(this);
}

final JOB_LIST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'jobList'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'jobs'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'applyUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'locationNames'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'slug'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'tags'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'company'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'slug'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'websiteUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class JobListQuery extends GraphQLQuery<JobList$Query, JsonSerializable> {
  JobListQuery();

  @override
  final DocumentNode document = JOB_LIST_QUERY_DOCUMENT;

  @override
  final String operationName = 'jobList';

  @override
  List<Object?> get props => [document, operationName];
  @override
  JobList$Query parse(Map<String, dynamic> json) =>
      JobList$Query.fromJson(json);
}
