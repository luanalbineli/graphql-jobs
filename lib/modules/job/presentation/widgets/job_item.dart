import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/company_image.dart';
import 'package:graphql_jobs/router/app_router.gr.dart';
import 'package:timeago/timeago.dart' as time_ago;

class JobItem extends StatelessWidget {
  final Job _job;

  const JobItem(this._job);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _goToJobDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultMargin),
          child: IntrinsicHeight(
            child: Row(
              children: [
                CompanyImage(
                  _job.company,
                  size: AppDimens.jobListCompanyImageSize,
                ),
                const SizedBox(width: AppDimens.defaultMargin),
                _buildJobContent(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobContent(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _job.title,
            style: textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: AppDimens.defaultMargin025x,
          ),
          Text(_job.company.name, style: textTheme.caption),
          const SizedBox(
            height: AppDimens.defaultMargin2x,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.gray,
                size: AppDimens.jobListLocationIconSize,
              ),
              const SizedBox(
                width: AppDimens.defaultMargin025x,
              ),
              Expanded(
                child: Text(
                  _job.locationNames ?? appLocalizations.jobLocationUnknown,
                  style: textTheme.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: AppDimens.defaultMargin05x,
              ),
              _buildTimeAgoText(textTheme)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTimeAgoText(TextTheme textTheme) {
    final timeAgoText = time_ago.format(_job.createdAt);
    return Text(timeAgoText, style: textTheme.caption);
  }

  void _goToJobDetail(BuildContext context) {
    context.router.push(JobDetailPageRoute(job: _job));
  }
}
