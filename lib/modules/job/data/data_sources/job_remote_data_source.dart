import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_jobs/graphql/api.graphql.dart';
import 'package:graphql_jobs/modules/job/data/models/job_model.dart';
import 'package:injectable/injectable.dart';

abstract class JobRemoteDataSource {
  const JobRemoteDataSource();

  Future<List<JobModel>> getJobList();
}

@Injectable(as: JobRemoteDataSource)
class JobRemoteDataSourceImpl extends JobRemoteDataSource {
  final GraphQLClient _graphQLClient;

  const JobRemoteDataSourceImpl(this._graphQLClient);

  @override
  Future<List<JobModel>> getJobList() async {
    final query = JobListQuery();

    final queryResult =
        await _graphQLClient.query(QueryOptions(document: query.document));

    final exception = queryResult.exception;
    if (exception != null) {
      throw exception;
    }

    final parsedData = query.parse(queryResult.data!);
    return parsedData.jobs
        .map((jobQuery) => JobModel.fromJson(jobQuery.toJson()))
        .toList(growable: false);
  }
}
