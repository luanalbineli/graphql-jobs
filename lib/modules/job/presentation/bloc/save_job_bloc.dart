import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';

part 'save_job_event.dart';
part 'save_job_state.dart';

class SaveJobBloc extends Bloc<SaveJobEvent, SaveJobState> {
  SaveJobBloc() : super(const SaveJobStateInitial()) {
    on<SaveJobEventToggle>(_handleJobSavedToggle);
  }

  FutureOr<void> _handleJobSavedToggle(
      SaveJobEventToggle event, Emitter<SaveJobState> emit) {}
}
