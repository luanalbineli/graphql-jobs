import 'dart:ui';

class JobSavedKey {
  final String jobSlug;
  final String companySlug;

  const JobSavedKey({
    required this.jobSlug,
    required this.companySlug,
  });

  @override
  bool operator ==(Object other) =>
      other is JobSavedKey &&
      jobSlug == other.jobSlug &&
      companySlug == other.companySlug;

  @override
  int get hashCode => hashValues(jobSlug, companySlug);
}
