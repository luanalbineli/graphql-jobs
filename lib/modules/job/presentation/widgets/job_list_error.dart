import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/job_list_bloc.dart';

class JobListError extends StatelessWidget {
  const JobListError();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(AppDimens.defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.cloud_off,
            color: AppColors.gray,
            size: AppDimens.jobListErrorIconSize,
          ),
          const SizedBox(height: AppDimens.defaultMargin2x),
          Text(
            appLocalizations.jobListErrorTitle,
            style: textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimens.defaultMargin05x),
          Text(
            appLocalizations.jobListErrorMessage,
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimens.defaultMargin),
          ElevatedButton(
            onPressed: () => _tryLoadJobListAgain(context),
            child: Text(appLocalizations.jobListTryAgain),
          )
        ],
      ),
    );
  }

  void _tryLoadJobListAgain(BuildContext context) {
    BlocProvider.of<JobListBloc>(context).add(const JobListEventInit());
  }
}
