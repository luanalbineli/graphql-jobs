import 'package:equatable/equatable.dart';

class JobSavedKey extends Equatable {
  final String jobSlug;
  final String companySlug;

  const JobSavedKey({
    required this.jobSlug,
    required this.companySlug,
  });

  @override
  List<Object?> get props => [jobSlug, companySlug];
}
