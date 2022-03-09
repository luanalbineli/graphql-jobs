import 'package:flutter/material.dart';
import 'package:graphql_jobs/constants/app_constants.dart';
import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:injectable/injectable.dart';

abstract class UpdateJobListUseCase
    extends UseCase<List<Job>, UpdateJobListParams> {
  const UpdateJobListUseCase();
}

@Injectable(as: UpdateJobListUseCase)
class UpdateJobListUseCaseImpl extends UseCase<List<Job>, UpdateJobListParams> {
  const UpdateJobListUseCaseImpl();

  @override
  List<Job> execute(UpdateJobListParams params) {
    final jobIndex = params.jobList.indexOf(params.job);
    debugPrint('jobIndex: $jobIndex');
    if (jobIndex != AppConstants.indexNotFound) {
      final newJobList = [...params.jobList];
      newJobList[jobIndex] = params.job;
      return newJobList;
    }

    return params.jobList;
  }
}

class UpdateJobListParams {
  final List<Job> jobList;
  final Job job;

  UpdateJobListParams({
    required this.jobList,
    required this.job,
  });
}
