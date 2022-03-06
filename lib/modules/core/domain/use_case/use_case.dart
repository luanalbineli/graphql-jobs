import 'package:flutter/foundation.dart';
import 'package:graphql_jobs/modules/core/domain/use_case/use_case_result.dart';

abstract class AsyncUseCase<TResult, TParams> {
  const AsyncUseCase();

  @nonVirtual
  Future<UseCaseResult<TResult>> call(TParams params) async {
    try {
      final result = await execute(params);
      return UseCaseResult.success(data: result);
    } catch (exception, stacktrace) {
      // Proper error handling, like Crashlytics and stuff.
      debugPrint('An error occurred: $exception - $stacktrace');
      return UseCaseResult.error(exception: exception);
    }
  }

  Future<TResult> execute(TParams params);
}

class NoParams {
  static NoParams instance = const NoParams._();

  const NoParams._();
}
