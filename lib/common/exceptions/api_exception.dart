import 'package:kindred_mobile/common/exceptions/base_exception.dart';

class ApiException extends BaseException {
  final String message;

  const ApiException({required this.message});

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
    };
  }
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({required super.message});
}
