import 'package:flutter/material.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_savedd.dart';

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

  void _toggleJobSaved(BuildContext context) {}
}
