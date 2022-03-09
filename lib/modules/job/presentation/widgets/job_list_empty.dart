import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/constants/app_images.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_filter_type.dart';

class JobListEmpty extends StatelessWidget {
  final JobFilterType _jobFilterType;

  const JobListEmpty(this._jobFilterType);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final emptyMessage = _jobFilterType == JobFilterType.all
        ? appLocalizations.jobListEmptyMessage
        : appLocalizations.savedJobListEmptyMessage;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          AppImages.icEmptyFileGray,
          width: AppDimens.jobListEmptyImage,
        ),
        const SizedBox(height: AppDimens.defaultMargin2x),
        Text(
          appLocalizations.jobListEmptyTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimens.defaultMargin05x),
        Text(
          emptyMessage,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
