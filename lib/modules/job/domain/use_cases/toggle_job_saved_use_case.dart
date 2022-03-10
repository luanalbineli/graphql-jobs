import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job.dart';
import 'package:graphql_jobs/modules/job/domain/repositories/job_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToggleJobSavedUseCase
    extends AsyncUseCase<Job, ToggleJobSavedUseCaseParams> {
  final JobRepository _jobRepository;

  ToggleJobSavedUseCase(this._jobRepository);

  @override
  Future<Job> execute(ToggleJobSavedUseCaseParams params) async {
    final jobSavedKey = params.job.getJobSavedKey();

    if (params.job is SavedJob) {
      await _jobRepository.removeSavedJob(jobSavedKey);
      return (params.job as SavedJob).toJob();
    } else {
      await _jobRepository.addSavedJob(jobSavedKey);
      return SavedJob(job: params.job);
    }
  }
}

class ToggleJobSavedUseCaseParams {
  final Job job;

  const ToggleJobSavedUseCaseParams({required this.job});
}
