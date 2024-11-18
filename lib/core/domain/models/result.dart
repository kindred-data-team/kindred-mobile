import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

sealed class Result<T> {
  final bool isSuccess;
  const Result({required this.isSuccess});
}

final class Success<T> extends Result<T> with EquatableMixin {
  final T value;

  @protected
  @override
  List<Object?> get props => <Object?>[isSuccess, value];

  const Success(this.value) : super(isSuccess: true);
}

final class Failure<T> extends Result<T> with EquatableMixin {
  final String errorMessage;
  final Exception? exception;
  final StackTrace? stackTrace;

  @protected
  @override
  List<Object?> get props => <Object?>[isSuccess, errorMessage, exception, stackTrace];

  const Failure(this.errorMessage, [this.exception, this.stackTrace]) : super(isSuccess: false);
}
