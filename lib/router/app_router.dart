import 'package:auto_route/annotations.dart';
import 'package:graphql_jobs/modules/job/presentation/pages/job_detail_page.dart';
import 'package:graphql_jobs/modules/job/presentation/pages/job_list_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: JobListPage, initial: true),
    AutoRoute(page: JobDetailPage),
  ],
)
class $AppRouter {
  $AppRouter._();
}
