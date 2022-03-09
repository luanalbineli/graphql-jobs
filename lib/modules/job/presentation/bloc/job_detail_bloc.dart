import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:injectable/injectable.dart';

part 'job_detail_event.dart';
part 'job_detail_state.dart';

@injectable
class JobDetailBloc extends Bloc<JobDetailEvent, JobDetailState> {
  JobDetailBloc() : super(const JobDetailStateInitial()) {
    on<JobDetailEventShowDetail>(_showJobDetail);
  }

  FutureOr<void> _showJobDetail(
    JobDetailEventShowDetail event,
    Emitter<JobDetailState> emit,
  ) {
    emit(JobDetailStateShow(job: event.job));
  }
}
