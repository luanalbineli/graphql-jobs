import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/use_cases/toggle_job_saved.dart';
import 'package:injectable/injectable.dart';

part 'save_job_event.dart';
part 'save_job_state.dart';

@injectable
class SaveJobBloc extends Bloc<SaveJobEvent, SaveJobState> {
  final ToggleJobSavedUseCase _toggleJobSavedUseCase;
  SaveJobBloc(this._toggleJobSavedUseCase)
      : super(const SaveJobStateInitial()) {
    on<SaveJobEventToggle>(_handleJobSavedToggle);
  }

  FutureOr<void> _handleJobSavedToggle(
    SaveJobEventToggle event,
    Emitter<SaveJobState> emit,
  ) async {
    final params = ToggleJobSavedUseCaseParams(job: event.job);

    final result = await _toggleJobSavedUseCase.call(params);
    final SaveJobState state;
    if (result.isSuccess) {
      state = SaveJobStateChange(job: result.data!);
    } else {
      state = const SaveJobStateError();
    }

    emit(state);
  }
}
