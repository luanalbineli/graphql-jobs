// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../modules/job/domain/entities/job.dart' as _i6;
import '../modules/job/domain/entities/job_filter_type.dart' as _i5;
import '../modules/job/presentation/pages/job_detail_page.dart' as _i2;
import '../modules/job/presentation/pages/job_list_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    JobListPageRoute.name: (routeData) {
      final args = routeData.argsAs<JobListPageRouteArgs>(
          orElse: () => const JobListPageRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.JobListPage(jobFilterType: args.jobFilterType));
    },
    JobDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<JobDetailPageRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.JobDetailPage(args.job));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(JobListPageRoute.name, path: '/'),
        _i3.RouteConfig(JobDetailPageRoute.name, path: '/job-detail-page')
      ];
}

/// generated route for
/// [_i1.JobListPage]
class JobListPageRoute extends _i3.PageRouteInfo<JobListPageRouteArgs> {
  JobListPageRoute({_i5.JobFilterType jobFilterType = _i5.JobFilterType.all})
      : super(JobListPageRoute.name,
            path: '/',
            args: JobListPageRouteArgs(jobFilterType: jobFilterType));

  static const String name = 'JobListPageRoute';
}

class JobListPageRouteArgs {
  const JobListPageRouteArgs({this.jobFilterType = _i5.JobFilterType.all});

  final _i5.JobFilterType jobFilterType;

  @override
  String toString() {
    return 'JobListPageRouteArgs{jobFilterType: $jobFilterType}';
  }
}

/// generated route for
/// [_i2.JobDetailPage]
class JobDetailPageRoute extends _i3.PageRouteInfo<JobDetailPageRouteArgs> {
  JobDetailPageRoute({required _i6.Job job})
      : super(JobDetailPageRoute.name,
            path: '/job-detail-page', args: JobDetailPageRouteArgs(job: job));

  static const String name = 'JobDetailPageRoute';
}

class JobDetailPageRouteArgs {
  const JobDetailPageRouteArgs({required this.job});

  final _i6.Job job;

  @override
  String toString() {
    return 'JobDetailPageRouteArgs{job: $job}';
  }
}
