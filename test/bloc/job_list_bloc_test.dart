import 'package:faker/faker.dart' as faker;
import 'package:graphql_jobs/modules/core/domain/use_case/use_case_result.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/get_job_list_use_case.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/update_job_list_use_case.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_list_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../extensions/faker_extensions.dart';

class MockGetJobListUseCase extends Mock implements GetJobListUseCase {}

class MockUpdateJobListUseCase extends Mock implements UpdateJobListUseCase {}

void main() {
  final _getJobListUseCase = MockGetJobListUseCase();
  final _updateJobListUseCase = MockUpdateJobListUseCase();
  late JobListBloc bloc;

  setUp(() {
    resetMocktailState();

    bloc = JobListBloc(_getJobListUseCase, _updateJobListUseCase);
  });

  test('Init test with successful response', () async {
    const jobFilterType = JobFilterType.all;

    final expectedJobList = faker.faker.getJobList(4);

    const params = GetJobListParams(jobFilterType: jobFilterType);

    when(() => _getJobListUseCase.call(params)).thenAnswer(
      (invocation) =>
          Future.value(UseCaseResult.success(data: expectedJobList)),
    );

    bloc.add(const JobListEventInit(jobFilterType: jobFilterType));

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const JobListStateLoading(),
        JobListStateLoaded(jobList: expectedJobList),
      ]),
      reason: 'Assert the state stream with loading + loaded',
    );

    verify(() => _getJobListUseCase.call(params));
  });

  test('Init test with error response', () async {
    const jobFilterType = JobFilterType.saved;

    const params = GetJobListParams(jobFilterType: jobFilterType);

    when(() => _getJobListUseCase.call(params)).thenAnswer(
      (invocation) => Future.value(
        UseCaseResult.error(exception: Exception('Error response')),
      ),
    );

    bloc.add(const JobListEventInit(jobFilterType: jobFilterType));

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const JobListStateLoading(),
        const JobListStateError(jobFilterType: jobFilterType),
      ]),
      reason: 'Assert the state stream with loading + error',
    );

    verify(() => _getJobListUseCase.call(params));
  });

  test('Job update test', () async {
    const jobFilterType = JobFilterType.all;

    final expectedJobList = faker.faker.getJobList(3);

    const getJobListParams = GetJobListParams(jobFilterType: jobFilterType);

    when(() => _getJobListUseCase.call(getJobListParams)).thenAnswer(
      (invocation) =>
          Future.value(UseCaseResult.success(data: expectedJobList)),
    );

    bloc.add(const JobListEventInit(jobFilterType: jobFilterType));

    final jobToUpdate = expectedJobList[1];
    final updatedJob = SavedJob(job: jobToUpdate);

    final expectedUpdatedJobList = [
      expectedJobList[0],
      updatedJob,
      expectedJobList[1]
    ];

    final updateJobListParams =
        UpdateJobListParams(jobList: expectedJobList, job: updatedJob);

    when(() => _updateJobListUseCase.call(updateJobListParams))
        .thenReturn(UseCaseResult.success(data: expectedUpdatedJobList));

    bloc.add(JobListEventUpdateJob(job: updatedJob));

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const JobListStateLoading(),
        JobListStateLoaded(jobList: expectedJobList),
        JobListStateLoaded(
          jobList: expectedUpdatedJobList,
        ),
      ]),
      reason:
          'Assert the state stream with loading + loaded + loaded (with updated list)',
    );
  });

  // This condition will most likely not happen, only in unit testing.
  test('Job update without loaded state', () async {
    bloc.add(JobListEventUpdateJob(job: faker.faker.getJob()));

    await expectLater(
      bloc.stream,
      emitsInOrder([]),
      reason: 'The state stream must be empty',
    );
  });

  test('Init test with empty successful response', () async {
    const jobFilterType = JobFilterType.all;

    final List<Job> expectedJobList = [];

    const params = GetJobListParams(jobFilterType: jobFilterType);

    when(() => _getJobListUseCase.call(params)).thenAnswer(
      (invocation) =>
          Future.value(UseCaseResult.success(data: expectedJobList)),
    );

    bloc.add(const JobListEventInit(jobFilterType: jobFilterType));

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const JobListStateLoading(),
        const JobListStateEmpty(jobFilterType: jobFilterType),
      ]),
      reason: 'Assert the state stream with loading + empty',
    );

    verify(() => _getJobListUseCase.call(params));
  });
}
