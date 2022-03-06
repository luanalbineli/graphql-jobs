import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class MainModule {
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
