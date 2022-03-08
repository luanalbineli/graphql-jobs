abstract class EnvironmentConfig {
  abstract String baseUrl;
}

class EnvironmentConfigProduction extends EnvironmentConfig {
  @override
  String baseUrl = 'https://api.graphql.jobs/';
}
