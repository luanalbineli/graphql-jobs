import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/di/injection.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_detail_bloc.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/save_job_bloc.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_detail.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/save_job_button.dart';

class JobDetailPage extends StatelessWidget {
  final Job _job;

  const JobDetailPage(this._job);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final jobDetailBloc = getIt<JobDetailBloc>()
      ..add(JobDetailEventShowDetail(job: _job));

    return BlocProvider<JobDetailBloc>(
      create: (_) => jobDetailBloc,
      child: BlocListener<SaveJobBloc, SaveJobState>(
        listener: _handleSaveJobChanges,
        child: Scaffold(
          appBar: AppBar(
            title: Text(appLocalizations.jobDetailTitle),
            actions: [_buildSaveJobAction()],
          ),
          // I didn't wrap the entire widget into a BlocBuilder,
          // because only the action need to be updated when the job entity changes.
          body: JobDetail(_job),
        ),
      ),
    );
  }

  Widget _buildSaveJobAction() {
    return BlocBuilder<JobDetailBloc, JobDetailState>(
      builder: (context, state) {
        if (state is JobDetailStateShow) {
          return SaveJobButton(
            state.job,
            activeColor: Colors.brown,
            inactiveColor: AppColors.wildSand,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _handleSaveJobChanges(BuildContext context, SaveJobState state) {
    if (state is SaveJobStateChange) {
      BlocProvider.of<JobDetailBloc>(context)
          .add(JobDetailEventShowDetail(job: state.job));
    }
  }
}
