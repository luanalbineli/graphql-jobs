import 'package:equatable/equatable.dart';
import 'package:graphql_jobs/constants/app_constants.dart';
import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:injectable/injectable.dart';

abstract class UpdateJobListUseCase
    extends UseCase<List<Job>, UpdateJobListParams> {
  const UpdateJobListUseCase();
}

@Injectable(as: UpdateJobListUseCase)
class UpdateJobListUseCaseImpl extends UpdateJobListUseCase {
  const UpdateJobListUseCaseImpl();

  @override
  List<Job> execute(UpdateJobListParams params) {
    final jobIndex = params.jobList.indexWhere(
      (element) => element.slug == params.job.slug,
    );

    if (jobIndex != AppConstants.indexNotFound) {
      final newJobList = [...params.jobList];
      newJobList[jobIndex] = params.job;
      return newJobList;
    }

    return params.jobList;
  }
}

class UpdateJobListParams extends Equatable {
  final List<Job> jobList;
  final Job job;

  const UpdateJobListParams({
    required this.jobList,
    required this.job,
  });

  @override
  List<Object?> get props => [jobList, job];
}
