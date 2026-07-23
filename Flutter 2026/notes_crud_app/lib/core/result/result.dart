import '../error/failures.dart';

abstract class Result<T> {
  const Result();
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  R when<R>({required R Function(T data) success, required R Function(Failure failure) failure}) {
    final Result<T> self = this;
    if (self is Success<T>) return success(self.data);
    if (self is FailureResult<T>) return failure(self.failure);
    throw StateError('Unhandled Result subtype');
  }
}

class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);
  final Failure failure;
}

