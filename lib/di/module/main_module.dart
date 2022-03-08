import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_jobs/di/module/environment_config.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class MainModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  EnvironmentConfig get environmentConfig => EnvironmentConfigProduction();

  GraphQLClient getGraphQLClient() {
    final httpLink = HttpLink(
      'https://api.graphql.jobs/',
    );

    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }
}
