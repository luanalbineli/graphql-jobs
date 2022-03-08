part of 'save_job_bloc.dart';

abstract class SaveJobEvent {
  const SaveJobEvent();
}

class SaveJobEventToggle extends SaveJobEvent {
  final Job job;

  const SaveJobEventToggle({required this.job});
}
