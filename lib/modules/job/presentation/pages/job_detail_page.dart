import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/company_image.dart';
import 'package:timeago/timeago.dart' as time_ago;

class JobDetailPage extends StatelessWidget {
  final Job _job;

  const JobDetailPage(this._job);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.jobListTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultMargin),
        child: Column(
          children: [
            CompanyImage(
              _job.company,
              size: AppDimens.jobDetailCompanyImageSize,
            ),
            const SizedBox(
              height: AppDimens.defaultMargin,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                _job.title,
                style:
                    textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: AppDimens.defaultMargin,
            ),
            _buildJobDetailRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildJobDetailRow() {
    final jobDetailWidgetList = [
      _buildJobDetailRowText(_job.company.name),
      _buildJobDetailRowDot()
    ];
    if (_job.locationNames != null) {
      jobDetailWidgetList.addAll(
        [_buildJobDetailRowText(_job.locationNames!), _buildJobDetailRowDot()],
      );
    }

    final timeAgoText = time_ago.format(_job.createdAt);

    jobDetailWidgetList.add(_buildJobDetailRowText(timeAgoText));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: jobDetailWidgetList,
    );
  }

  Widget _buildJobDetailRowText(String text) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.defaultMargin05x),
        child: Text(text),
      );

  Widget _buildJobDetailRowDot() => Container(
        width: 4,
        height: 4,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.gray,
        ),
      );
}
