import 'package:kindred_mobile/common/exceptions/api_exception.dart';

abstract class DataState<T> {
  final T? data;
  final ApiException? exception;

  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ApiException exeption) : super(exception: exeption);
}
