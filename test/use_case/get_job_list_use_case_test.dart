import 'package:faker/faker.dart' as faker;
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
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

    expect(result.isSuccess, isTrue, reason: 'The result must be successful');
    expect(result.data, expectedJobList, reason: 'Assert the job list');
  });
}
