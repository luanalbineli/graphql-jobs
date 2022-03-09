import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_list_bloc.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/save_job_bloc.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_item.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_list_error.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_list_loading.dart';

class JobList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveJobBloc, SaveJobState>(
      listener: _handleSaveJobChanges,
      child: BlocBuilder<JobListBloc, JobListState>(
        builder: (context, state) {
          if (state is JobListStateLoaded) {
            return _buildLoadedState(state);
          }

          if (state is JobListStateError) {
            return JobListError(state.jobFilterType);
          }

          // Loading
          return const JobListLoading();
        },
      ),
    );
  }

  Widget _buildLoadedState(JobListStateLoaded state) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppDimens.defaultMargin),
      itemCount: state.jobList.length,
      itemBuilder: (context, index) => JobItem(state.jobList[index]),
      separatorBuilder: (_, __) => const SizedBox(
        height: AppDimens.defaultMargin,
      ),
    );
  }

  void _handleSaveJobChanges(BuildContext context, SaveJobState state) {
    if (state is SaveJobStateChange) {
      BlocProvider.of<JobListBloc>(context)
          .add(JobListEventUpdateJob(job: state.job));
    }
  }
}
