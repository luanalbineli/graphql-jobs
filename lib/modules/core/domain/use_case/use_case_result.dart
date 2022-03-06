class UseCaseResult<T> {
  UseCaseResult.success({required this.data})
      : type = UseCaseResultType.success,
        exception = null;

  UseCaseResult.error({required this.exception})
      : type = UseCaseResultType.error,
        data = null;

  final T? data;
  final dynamic exception;
  final UseCaseResultType type;

  bool get isSuccess => type == UseCaseResultType.success;
  bool get isError => type == UseCaseResultType.error;

  @override
  String toString() {
    if (isSuccess) {
      return 'SUCCESS - ${data.toString()}';
    }

    return 'ERROR - ${exception.toString()}';
  }
}

enum UseCaseResultType {
  success,
  error,
}
