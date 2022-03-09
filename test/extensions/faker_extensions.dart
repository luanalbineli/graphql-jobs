import 'package:faker/faker.dart' as faker;
import 'package:graphql_jobs/modules/job/domain/entities/company.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job.dart';
import 'package:graphql_jobs/modules/job/domain/entities/job_tag.dart';

extension FakerExtensions on faker.Faker {
  Job getJob() => Job(
        title: faker.faker.job.title(),
        applyUrl: faker.faker.internet.httpsUrl(),
        company: Company(
          name: faker.faker.company.name(),
          slug: faker.faker.company.suffix(),
          websiteUrl: faker.faker.internet.httpsUrl(),
        ),
        slug: faker.faker.job.random.toString(),
        createdAt: faker.faker.date.dateTime(),
        description: faker.faker.lorem.sentence(),
        tags: List.generate(
          faker.faker.randomGenerator.integer(6, min: 1),
          (index) => JobTag(name: faker.faker.lorem.word()),
        ),
      );

  List<Job> getJobList(int length) => List.generate(
        length,
        (index) => getJob(),
      );
}
