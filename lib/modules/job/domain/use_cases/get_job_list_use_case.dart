import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/repositories/job_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetJobListUseCase extends AsyncUseCase<List<Job>, NoParams> {
  final JobRepository _jobRepository;
  const GetJobListUseCase(this._jobRepository);

  @override
  Future<List<Job>> execute(NoParams params) => _jobRepository.getJobList();
}
