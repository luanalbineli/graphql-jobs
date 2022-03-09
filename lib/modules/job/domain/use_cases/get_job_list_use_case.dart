import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_saved_key.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_savedd.dart';
import 'package:graphql_jobs/modules/job/domain/repositories/job_repository.dart';
import 'package:injectable/injectable.dart';

abstract class GetJobListUseCase
    extends AsyncUseCase<List<Job>, GetJobListParams> {
  const GetJobListUseCase();
}

@Injectable(as: GetJobListUseCase)
class GetJobListUseCaseImpl extends GetJobListUseCase {
  final JobRepository _jobRepository;
  const GetJobListUseCaseImpl(this._jobRepository);

  @override
  Future<List<Job>> execute(GetJobListParams params) async {
    final jobList = await _jobRepository.getJobList();
    final savedJobKeyList = _jobRepository.getJobSavedKeyList();

    if (params.jobFilterType == JobFilterType.all) {
      return _mapJobList(jobList, savedJobKeyList);
    }

    return _getSavedJobInfo(savedJobKeyList);
  }

  List<Job> _mapJobList(List<Job> jobList, List<JobSavedKey> savedJobKeyList) {
    return jobList.map((job) {
      final jobSavedKey = job.getJobSavedKey();
      if (savedJobKeyList.contains(jobSavedKey)) {
        return JobSaved(job: job);
      }

      return job;
    }).toList(growable: false);
  }

  Future<List<Job>> _getSavedJobInfo(List<JobSavedKey> savedJobKeyList) async {
    return Future.wait(
      savedJobKeyList
          .map((savedJobKey) => _jobRepository.getSavedJob(savedJobKey))
          .toList(),
    );
  }
}

class GetJobListParams {
  final JobFilterType jobFilterType;
  const GetJobListParams({required this.jobFilterType});
}
