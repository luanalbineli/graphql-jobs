import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/presentation/widgets/company_image.dart';
import 'package:timeago/timeago.dart' as time_ago;
import 'package:url_launcher/url_launcher.dart';

class JobDetail extends StatelessWidget {
  final Job _job;

  const JobDetail(this._job);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.defaultMargin),
      child: Column(
        children: [
          Expanded(
            child:
                SingleChildScrollView(child: _buildJobDetailContent(context)),
          ),
          const SizedBox(
            height: AppDimens.defaultMargin,
          ),
          _buildApplyNowButton(context),
        ],
      ),
    );
  }

  Widget _buildJobDetailContent(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CompanyImage(
          _job.company,
          size: AppDimens.jobDetailCompanyImageSize,
        ),
        const SizedBox(
          height: AppDimens.defaultMargin,
        ),
        _buildJobTitle(textTheme),
        const SizedBox(
          height: AppDimens.defaultMargin,
        ),
        _buildJobDetailRow(context),
        const SizedBox(
          height: AppDimens.defaultMargin2x,
        ),
        _buildJobDetailTagList(textTheme),
        const SizedBox(
          height: AppDimens.defaultMargin2x,
        ),
        _buildJobDetailDescription(textTheme),
      ],
    );
  }

  Widget _buildJobTitle(TextTheme textTheme) => SizedBox(
        width: double.infinity,
        child: Text(
          _job.title,
          style: textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget _buildJobDetailRow(BuildContext context) {
    final jobDetailWidgetList = [
      _buildJobDetailRowText(context, _job.company.name),
      _buildJobDetailRowDot()
    ];
    if (_job.locationNames != null) {
      jobDetailWidgetList.addAll(
        [
          _buildJobDetailRowText(context, _job.locationNames!),
          _buildJobDetailRowDot()
        ],
      );
    }

    final timeAgoText = time_ago.format(_job.createdAt);

    jobDetailWidgetList.add(_buildJobDetailRowText(context, timeAgoText));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: jobDetailWidgetList,
    );
  }

  Widget _buildJobDetailRowText(BuildContext context, String text) => Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.defaultMargin05x),
        child: Text(
          text,
          style: Theme.of(context).textTheme.caption,
        ),
      );

  Widget _buildJobDetailRowDot() => Container(
        width: AppDimens.jobDetailDotSize,
        height: AppDimens.jobDetailDotSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      );

  Widget _buildJobDetailTagList(TextTheme textTheme) {
    final tagWidgetList = _job.tags
        .map(
          (e) => Container(
            padding: const EdgeInsets.all(AppDimens.defaultMargin05x),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Text(e.name, style: textTheme.labelSmall),
          ),
        )
        .toList(growable: false);

    return Wrap(
      runSpacing: AppDimens.jobDetailTagItemSpacing,
      spacing: AppDimens.jobDetailTagItemSpacing,
      alignment: WrapAlignment.center,
      children: tagWidgetList,
    );
  }

  Widget _buildJobDetailDescription(TextTheme textTheme) {
    return Text(_job.description);
  }

  Widget _buildApplyNowButton(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      height: AppDimens.jobDetailApplyButtonHeight,
      child: ElevatedButton(
        onPressed: () => _applyToJob(context),
        child: Text(appLocalizations.jobDetailApplyNow),
      ),
    );
  }

  Future<void> _applyToJob(BuildContext context) async {
    final appLocalizations = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final launchedUrl = await launch(_job.applyUrl);

    if (!launchedUrl) {
      final snackBar = SnackBar(
        content: Text(appLocalizations.jobDetailErrorApplyNow),
      );
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(snackBar);
    }
  }
}
