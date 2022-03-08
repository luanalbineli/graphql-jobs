import 'package:graphql_jobs/modules/job/domain/entities/job.dart';

class JobSaved extends Job {
  JobSaved({required Job job})
      : super(
          title: job.title,
          applyUrl: job.applyUrl,
          description: job.description,
          createdAt: job.createdAt,
          slug: job.slug,
          locationNames: job.locationNames,
          company: job.company,
          tags: job.tags,
        );

  Job toJob() => Job(
        title: title,
        applyUrl: applyUrl,
        description: description,
        createdAt: createdAt,
        slug: slug,
        locationNames: locationNames,
        company: company,
        tags: tags,
      );
}
