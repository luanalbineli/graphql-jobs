part of 'job_list_bloc.dart';

abstract class JobListEvent {
  const JobListEvent();
}

class JobListEventInit extends JobListEvent {
  final JobFilterType jobFilterType;
  const JobListEventInit({required this.jobFilterType});
}

class JobListEventUpdateJob extends JobListEvent {
  final Job job;

  JobListEventUpdateJob({required this.job});
}
