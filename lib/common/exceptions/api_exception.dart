import 'package:kindred_app/common/exceptions/base_exception.dart';
import 'package:kindred_app/common/utils/json_convertible.dart';

class ApiException extends JsonConvertible implements BaseException {
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
