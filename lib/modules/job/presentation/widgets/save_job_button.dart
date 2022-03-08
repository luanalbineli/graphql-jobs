import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_savedd.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/save_job_bloc.dart';

class SaveJobButton extends StatelessWidget {
  final Job _job;

  const SaveJobButton(this._job);

  @override
  Widget build(BuildContext context) {
    final icon = _job is JobSaved ? Icons.bookmark_added : Icons.bookmark_add;

    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () => _toggleJobSaved(context),
      icon: Icon(icon),
    );
  }

  void _toggleJobSaved(BuildContext context) {
    BlocProvider.of<SaveJobBloc>(context).add(SaveJobEventToggle(job: _job));
  }
}
