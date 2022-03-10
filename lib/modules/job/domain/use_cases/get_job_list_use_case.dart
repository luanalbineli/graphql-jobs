import 'package:equatable/equatable.dart';
import 'package:graphql_jobs/constants/app_constants.dart';
import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/saved_job_key.dart';
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
    final savedJobKeyList = _jobRepository.getJobSavedKeyList();

    if (params.jobFilterType == JobFilterType.all) {
      final jobList = await _jobRepository.getJobList();
      return _mapJobList(jobList, savedJobKeyList);
    }

    return _getSavedJobInfo(savedJobKeyList);
  }

  List<Job> _mapJobList(List<Job> jobList, List<SavedJobKey> savedJobKeyList) {
    return jobList.map((job) {
      final jobSavedKey = job.getJobSavedKey();
      final savedKeyIndex = savedJobKeyList.indexWhere(
        (key) =>
            key.jobSlug == jobSavedKey.jobSlug &&
            key.companySlug == jobSavedKey.companySlug,
      );

      if (savedKeyIndex != AppConstants.indexNotFound) {
        return SavedJob(job: job);
      }

      return job;
    }).toList(growable: false);
  }

  Future<List<Job>> _getSavedJobInfo(List<SavedJobKey> savedJobKeyList) async {
    return Future.wait(
      savedJobKeyList
          .map((savedJobKey) => _jobRepository.getSavedJob(savedJobKey))
          .toList(),
    );
  }
}

class GetJobListParams extends Equatable {
  final JobFilterType jobFilterType;
  const GetJobListParams({required this.jobFilterType});

  @override
  List<Object?> get props => [jobFilterType];
}
