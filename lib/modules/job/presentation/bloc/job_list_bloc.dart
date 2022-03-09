import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/get_job_list_use_case.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/update_job_list_use_case.dart';
import 'package:injectable/injectable.dart';

part 'job_list_event.dart';
part 'job_list_state.dart';

@injectable
class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final GetJobListUseCase _getJobListUseCase;
  final UpdateJobListUseCase _updateJobListUseCase;

  JobListBloc(
    this._getJobListUseCase,
    this._updateJobListUseCase,
  ) : super(const JobListStateLoading()) {
    on<JobListEventInit>(_init);
    on<JobListEventUpdateJob>(_handleJobUpdate);
  }

  FutureOr<void> _init(
    JobListEventInit event,
    Emitter<JobListState> emit,
  ) async {
    emit(const JobListStateLoading());

    final params = GetJobListParams(jobFilterType: event.jobFilterType);
    final result = await _getJobListUseCase.call(params);

    final JobListState state;
    if (result.isError || result.data == null) {
      state = JobListStateError(jobFilterType: event.jobFilterType);
    } else {
      state = JobListStateLoaded(jobList: result.data!);
    }

    emit(state);
  }

  FutureOr<void> _handleJobUpdate(
    JobListEventUpdateJob event,
    Emitter<JobListState> emit,
  ) {
    if (state is! JobListStateLoaded) {
      return Future.value();
    }

    final jobList = (state as JobListStateLoaded).jobList;
    final params = UpdateJobListParams(jobList: jobList, job: event.job);
    final result = _updateJobListUseCase.call(params);
    if (result.isSuccess) {
      emit(JobListStateLoaded(jobList: result.data!));
    }
  }
}
