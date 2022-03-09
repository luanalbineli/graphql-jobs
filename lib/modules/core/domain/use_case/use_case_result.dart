class UseCaseResult<T> {
  UseCaseResult.success({required this.data})
      : _type = UseCaseResultType.success,
        exception = null;

  UseCaseResult.error({required this.exception})
      : _type = UseCaseResultType.error,
        data = null;

  final T? data;
  final dynamic exception;
  final UseCaseResultType _type;

  bool get isSuccess => _type == UseCaseResultType.success;
  bool get isError => _type == UseCaseResultType.error;

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
