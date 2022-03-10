import 'package:equatable/equatable.dart';

class SavedJobKey extends Equatable {
  final String jobSlug;
  final String companySlug;

  const SavedJobKey({
    required this.jobSlug,
    required this.companySlug,
  });

  @override
  List<Object?> get props => [jobSlug, companySlug];
}
