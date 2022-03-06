import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/di/injection.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_list_bloc.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_list.dart';

class JobListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobListBloc = getIt<JobListBloc>()..add(const JobListEventInit());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: BlocProvider<JobListBloc>(
        create: (_) => jobListBloc,
        child: JobList(),
      ),
    );
  }
}
