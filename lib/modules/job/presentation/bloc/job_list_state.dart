part of 'job_list_bloc.dart';

abstract class JobListState extends Equatable {
  const JobListState();
}

class JobListStateLoading extends JobListState {
  const JobListStateLoading();

  @override
  List<Object?> get props => [];
}

class JobListStateLoaded extends JobListState {
  final List<Job> jobList;

  const JobListStateLoaded({required this.jobList});

  @override
  List<Object?> get props => [jobList];
}

class JobListStateError extends JobListState {
  final JobFilterType jobFilterType;

  const JobListStateError({required this.jobFilterType});

  @override
  List<Object?> get props => [jobFilterType];
}

class JobListStateEmpty extends JobListState {
  final JobFilterType jobFilterType;

  const JobListStateEmpty({required this.jobFilterType});

  @override
  List<Object?> get props => [jobFilterType];
}
