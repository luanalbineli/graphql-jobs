import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/constants/app_images.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobItem extends StatelessWidget {
  final Job _job;

  const JobItem(this._job);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultMargin),
        child: IntrinsicHeight(
          child: Row(
            children: [
              _buildCompanyImage(context),
              const SizedBox(width: AppDimens.defaultMargin),
              _buildJobContent(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyImage(BuildContext context) {
    final companyImageUrl =
        AppImages.buildCompanyImageUrl(_job.company.websiteUrl);

    final companyImagePlaceholder = _buildCompanyImagePlaceholder(context);

    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: companyImageUrl,
      width: AppDimens.jobListCompanyImageSize,
      height: AppDimens.jobListCompanyImageSize,
      placeholder: (_, __) => companyImagePlaceholder,
      errorWidget: (_, __, error) => companyImagePlaceholder,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.jobListCompanyImageBorderRadius),
          ),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildCompanyImagePlaceholder(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.wildSand,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.jobListCompanyImageBorderRadius),
          ),
        ),
        child: Center(
          child: Text(
            _job.company.name.characters.first.toUpperCase(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      );

  Widget _buildJobContent(BuildContext context) {
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
                size: 14,
              ),
              const SizedBox(
                width: AppDimens.defaultMargin025x,
              ),
              Expanded(
                child: Text(
                  _job.locationNames ?? '-',
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
    final timeAgoText = timeago.format(_job.createdAt);
    return Text(timeAgoText, style: textTheme.caption);
  }
}
