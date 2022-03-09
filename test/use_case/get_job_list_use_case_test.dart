import 'package:faker/faker.dart' as faker;
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_saved_key.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_savedd.dart';
import 'package:graphql_jobs/modules/job/domain/repositories/job_repository.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/get_job_list_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../extensions/faker_extensions.dart';

class MockJobRepository extends Mock implements JobRepository {}

void main() {
  final _jobRepository = MockJobRepository();
  late GetJobListUseCase _getJobListUseCase;

  setUp(() {
    resetMocktailState();

    _getJobListUseCase = GetJobListUseCaseImpl(_jobRepository);

    registerFallbackValue(
      JobSavedKey(
        jobSlug: faker.faker.randomGenerator.string(10),
        companySlug: faker.faker.randomGenerator.string(10),
      ),
    );
  });

  test('All filter without saved jobs test', () async {
    final expectedJobList = faker.faker.getJobList(3);

    when(() => _jobRepository.getJobList())
        .thenAnswer((invocation) => Future.value(expectedJobList));

    when(() => _jobRepository.getJobSavedKeyList()).thenReturn([]);

    final result = await _getJobListUseCase
        .call(const GetJobListParams(jobFilterType: JobFilterType.all));

    verify(() => _jobRepository.getJobList());
    verify(() => _jobRepository.getJobSavedKeyList());
    verifyNever(() => _jobRepository.getSavedJob(any()));

    expect(result.isSuccess, isTrue, reason: 'The result must be successful');
    expect(result.data, expectedJobList, reason: 'Assert the job list');
  });

  test('All filter with saved jobs test', () async {
    final jobList = faker.faker.getJobList(2);

    when(() => _jobRepository.getJobList())
        .thenAnswer((invocation) => Future.value(jobList));

    const savedJobIndex = 1;
    when(() => _jobRepository.getJobSavedKeyList())
        .thenReturn([jobList[savedJobIndex].getJobSavedKey()]);

    final result = await _getJobListUseCase
        .call(const GetJobListParams(jobFilterType: JobFilterType.all));

    verify(() => _jobRepository.getJobList());
    verify(() => _jobRepository.getJobSavedKeyList());
    verifyNever(() => _jobRepository.getSavedJob(any()));

    expect(result.isSuccess, isTrue, reason: 'The result must be successful');
    expect(
      result.data,
      [
        jobList[0],
        JobSaved(
          job: jobList[savedJobIndex],
        )
      ],
      reason: 'Assert the job list with a single saved job',
    );
  });

  test('Saved filter without saved jobs test', () async {
    when(() => _jobRepository.getJobSavedKeyList()).thenReturn([]);

    final result = await _getJobListUseCase
        .call(const GetJobListParams(jobFilterType: JobFilterType.saved));

    verify(() => _jobRepository.getJobSavedKeyList());
    verifyNever(() => _jobRepository.getSavedJob(any()));

    expect(result.isSuccess, isTrue, reason: 'The result must be successful');
    expect(
      result.data,
      [],
      reason: 'Assert the empty job list',
    );
  });

  test('Saved filter without saved jobs test', () async {
    when(() => _jobRepository.getJobSavedKeyList()).thenReturn([]);

    final result = await _getJobListUseCase
        .call(const GetJobListParams(jobFilterType: JobFilterType.saved));

    verify(() => _jobRepository.getJobSavedKeyList());
    verifyNever(() => _jobRepository.getSavedJob(any()));

    expect(result.isSuccess, isTrue, reason: 'The result must be successful');
    expect(
      result.data,
      [],
      reason: 'Assert the empty job list',
    );
  });

  test('Saved filter with saved jobs test', () async {
    final savedJobList =
        faker.faker.getJobList(5).map((job) => JobSaved(job: job)).toList();

    final savedJobKeyList =
        savedJobList.map((job) => job.getJobSavedKey()).toList();

    when(() => _jobRepository.getJobSavedKeyList()).thenReturn(savedJobKeyList);
    for (int savedJobListIndex = 0;
        savedJobListIndex < savedJobKeyList.length;
        savedJobListIndex++) {
      when(() => _jobRepository.getSavedJob(savedJobKeyList[savedJobListIndex]))
          .thenAnswer(
        (invocation) => Future.value(savedJobList[savedJobListIndex]),
      );
    }

    final result = await _getJobListUseCase
        .call(const GetJobListParams(jobFilterType: JobFilterType.saved));

    verifyNever(() => _jobRepository.getJobList());

    verify(() => _jobRepository.getJobSavedKeyList());
    for (final jobSavedKey in savedJobKeyList) {
      verify(() => _jobRepository.getSavedJob(jobSavedKey));
    }

    expect(result.isSuccess, isTrue, reason: 'The result must be successful');
    expect(
      result.data,
      savedJobList,
      reason: 'Assert the saved job list',
    );
  });
}
