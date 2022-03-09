import 'package:faker/faker.dart' as faker;
import 'package:graphql_jobs/modules/job/domain/entities/company.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_tag.dart';

extension FakerExtensions on faker.Faker {
  Job getJob() => Job(
        title: job.title(),
        applyUrl: internet.httpsUrl(),
        company: Company(
          name: company.name(),
          slug: guid.guid(),
          websiteUrl: internet.httpsUrl(),
        ),
        slug: guid.guid(),
        createdAt: date.dateTime(),
        description: lorem.sentence(),
        tags: List.generate(
          randomGenerator.integer(6, min: 1),
          (index) => JobTag(name: lorem.word()),
        ),
      );

  List<Job> getJobList(int length) => List.generate(
        length,
        (index) => getJob(),
      );
}
