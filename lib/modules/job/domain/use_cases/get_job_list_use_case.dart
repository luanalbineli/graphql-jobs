import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_savedd.dart';
import 'package:graphql_jobs/modules/job/domain/repositories/job_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetJobListUseCase extends AsyncUseCase<List<Job>, NoParams> {
  final JobRepository _jobRepository;
  const GetJobListUseCase(this._jobRepository);

  @override
  Future<List<Job>> execute(NoParams params) async {
    final jobList = await _jobRepository.getJobList();
    final savedJobKeyList = _jobRepository.getJobSavedKeyList();

    return jobList.map((job) {
      final jobSavedKey = job.getJobSavedKey();
      if (savedJobKeyList.contains(jobSavedKey)) {
        return JobSaved(job: job);
      }

      return job;
    }).toList(growable: false);
  }
}
