import 'package:graphql_jobs/modules/core/domain/use_case/use_case_result.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/get_job_list_use_case.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/update_job_list_use_case.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_list_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGetJobListUseCase extends Mock implements GetJobListUseCase {}

class MockUpdateJobListUseCase extends Mock implements UpdateJobListUseCase {}

void main() {
  final _getJobListUseCase = MockGetJobListUseCase();
  final _updateJobListUseCase = MockUpdateJobListUseCase();

  setUp(() {
    resetMocktailState();
  });

  test('Bloc init test with all jobs', () {
    final jobListBloc = JobListBloc(_getJobListUseCase, _updateJobListUseCase);

    expect(
      jobListBloc.state,
      const JobListStateLoading(),
      reason: 'The initial state of the Bloc must be $JobListStateLoading',
    );

    const getJobListParams = GetJobListParams(jobFilterType: JobFilterType.all);

    when(() => _getJobListUseCase.call(getJobListParams)).thenAnswer(
      (invocation) => Future.value(UseCaseResult.success(data: [])),
    );

    jobListBloc.add(const JobListEventInit(jobFilterType: JobFilterType.all));

    verify(
      () => _getJobListUseCase.call(getJobListParams),
    );
  });
}
