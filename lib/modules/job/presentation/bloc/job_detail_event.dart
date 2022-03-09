part of 'job_detail_bloc.dart';

abstract class JobDetailEvent {
  const JobDetailEvent();
}

class JobDetailEventShowDetail extends JobDetailEvent {
  final Job job;
  const JobDetailEventShowDetail({required this.job});
}
