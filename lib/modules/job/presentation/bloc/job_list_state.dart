part of 'job_list_bloc.dart';

abstract class JobListState {
  const JobListState();
}

class JobListStateLoading extends JobListState {
  const JobListStateLoading();
}

class JobListStateLoaded extends JobListState {
  final List<Job> jobList;

  const JobListStateLoaded({required this.jobList});
}

class JobListStateError extends JobListState {
  const JobListStateError();
}
