import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_jobs/di/injection.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_list_bloc.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_list.dart';
import 'package:graphql_jobs/router/app_router.gr.dart';

class JobListPage extends StatelessWidget {
  final JobFilterType jobFilterType;

  const JobListPage({this.jobFilterType = JobFilterType.all});

  @override
  Widget build(BuildContext context) {
    final jobListBloc = getIt<JobListBloc>()
      ..add(JobListEventInit(jobFilterType: jobFilterType));

    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(context),
        actions: _getActions(context),
      ),
      body: BlocProvider<JobListBloc>(
        create: (_) => jobListBloc,
        child: JobList(),
      ),
    );
  }

  List<Widget> _getActions(BuildContext context) {
    final List<Widget> actionWidgetList = [];

    if (jobFilterType == JobFilterType.all) {
      final appLocalizations = AppLocalizations.of(context)!;
      actionWidgetList.add(
        TextButton(
          onPressed: () => _openSaveJobList(context),
          child: Text(
            appLocalizations.jobListSaved.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return actionWidgetList;
  }

  void _openSaveJobList(BuildContext context) {
    context.router.push(JobListPageRoute(jobFilterType: JobFilterType.saved));
  }

  Widget _buildTitle(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final text = jobFilterType == JobFilterType.all
        ? appLocalizations.jobListTitle
        : appLocalizations.jobSavedListTitle;

    return Text(text);
  }
}
