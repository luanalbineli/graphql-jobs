part of 'job_detail_bloc.dart';

abstract class JobDetailState {
  const JobDetailState();
}

class JobDetailStateInitial extends JobDetailState {
  const JobDetailStateInitial();
}

class JobDetailStateShow extends JobDetailState {
  final Job job;
  const JobDetailStateShow({required this.job});
}
