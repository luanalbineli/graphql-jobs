part of 'job_list_bloc.dart';

abstract class JobListEvent {
  const JobListEvent();
}

class JobListEventInit extends JobListEvent {
  const JobListEventInit();
}

class JobListEventUpdateJob extends JobListEvent {
  final Job job;

  JobListEventUpdateJob({required this.job});
}
