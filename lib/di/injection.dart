import 'package:get_it/get_it.dart';
import 'package:graphql_jobs/di/injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(getIt);
