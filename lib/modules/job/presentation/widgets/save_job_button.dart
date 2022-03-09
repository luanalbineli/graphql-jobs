import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/extensions/stateless_widget_extensions.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_savedd.dart';
import 'package:graphql_jobs/modules/job/presentation/bloc/save_job_bloc.dart';

class SaveJobButton extends StatelessWidget {
  final Job _job;
  final Color activeColor;
  final Color inactiveColor;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;

  const SaveJobButton(
    this._job, {
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.gray,
    this.constraints,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isJobSaved = _job is JobSaved;

    final icon = isJobSaved ? Icons.bookmark_added : Icons.bookmark_add;
    final iconColor = isJobSaved ? activeColor : inactiveColor;

    return BlocListener<SaveJobBloc, SaveJobState>(
      listener: _handleStateChanges,
      child: IconButton(
        padding: padding ?? const EdgeInsets.all(AppDimens.defaultMargin05x),
        constraints: constraints,
        onPressed: () => _toggleJobSaved(context),
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, SaveJobState state) {
    final appLocalizations = AppLocalizations.of(context)!;
    String? snackBarMessage;
    if (state is SaveJobStateChange) {
      final isJobSaved = state.job is JobSaved;
      snackBarMessage = isJobSaved
          ? appLocalizations.jobAddedSavedListSuccessMessage
          : appLocalizations.jobRemovedSavedListSuccessMessage;
    } else if (state is SaveJobStateError) {
      final isJobSaved = state.job is JobSaved;
      snackBarMessage = isJobSaved
          ? appLocalizations.jobInSavedListErrorMessage
          : appLocalizations.jobOutSavedListErrorMessage;
    }

    if (snackBarMessage != null) {
      showDefaultSnackBar(context, snackBarMessage);
    }
  }

  void _toggleJobSaved(BuildContext context) {
    BlocProvider.of<SaveJobBloc>(context).add(SaveJobEventToggle(job: _job));
  }
}
