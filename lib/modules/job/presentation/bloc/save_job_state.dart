part of 'save_job_bloc.dart';

abstract class SaveJobState {
  const SaveJobState();
}

class SaveJobStateInitial extends SaveJobState {
  const SaveJobStateInitial();
}

class SaveJobStateChange extends SaveJobState {
  final Job job;
  const SaveJobStateChange({required this.job});
}

class SaveJobStateError extends SaveJobState {
  const SaveJobStateError();
}
