import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_list_bloc.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_item.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/job_list_loading.dart';

class JobList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobListBloc, JobListState>(
      builder: (context, state) {
        if (state is JobListStateLoaded) {
          return _buildLoadedState(state);
        }

        if (state is JobListStateError) {
          return _buildErrorState();
        }

        // Loading
        return JobListLoading();
      },
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

  Widget _buildErrorState() {
    return const Text('ERROR');
  }
}
