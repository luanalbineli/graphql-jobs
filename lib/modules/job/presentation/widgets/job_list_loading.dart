import 'package:flutter/material.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/modules/core/presentation/widgets/skeleton_effect.dart';

class JobListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SkeletonEffect(
      child: ListView.separated(
        padding: const EdgeInsets.all(AppDimens.defaultMargin),
        itemCount: _numberOfItems,
        itemBuilder: (context, index) => _buildLoadingItem(),
        separatorBuilder: (_, __) => const SizedBox(
          height: AppDimens.defaultMargin,
        ),
      ),
    );
  }

  Widget _buildLoadingItem() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: AppDimens.jobListCompanyImageSize,
            height: AppDimens.jobListCompanyImageSize,
            color: Colors.white,
          ),
          const SizedBox(
            width: AppDimens.defaultMargin,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildLoadingItemRows(),
            ),
          )
        ],
      );

  List<Widget> _buildLoadingItemRows() {
    return List.generate(_numberOfRows * 2 - 1, (index) {
      if (index.isEven) {
        return Container(
          width: double.infinity,
          height: AppDimens.jobListLoadingRowHeight,
          color: Colors.white,
        );
      }

      return const SizedBox(
        height: AppDimens.defaultMargin05x,
      );
    });
  }

  static const _numberOfRows = 2;
  static const _numberOfItems = 8;
}
