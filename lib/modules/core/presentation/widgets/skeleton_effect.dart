import 'package:flutter/material.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonEffect extends StatelessWidget {
  final Widget child;

  const SkeletonEffect({required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.wildSand,
      highlightColor: Colors.white,
      child: child,
    );
  }
}
