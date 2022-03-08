import 'package:flutter/material.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_favorite.dart';

class SaveJobButton extends StatelessWidget {
  final JobFavorite _job;

  const SaveJobButton(this._job);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _toggleJobSaved(context),
        icon: const Icon(Icons.launch));
  }
}
