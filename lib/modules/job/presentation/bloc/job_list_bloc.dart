import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/modules/core/domain/use_case/use_case.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/get_job_list_use_case.dart';
import 'package:injectable/injectable.dart';

part 'job_list_event.dart';
part 'job_list_state.dart';

@injectable
class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final GetJobListUseCase _getJobListUseCase;

  JobListBloc(this._getJobListUseCase) : super(const JobListStateLoading()) {
    on<JobListEventInit>(_init);
  }

  FutureOr<void> _init(
    JobListEventInit event,
    Emitter<JobListState> emit,
  ) async {
    emit(const JobListStateLoading());

    final result = await _getJobListUseCase.call(NoParams.instance);

    final JobListState state;
    if (result.isError || result.data == null) {
      state = const JobListStateError();
    } else {
      state = JobListStateLoaded(jobList: result.data!);
    }

    emit(state);
  }
}
