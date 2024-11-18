
import 'package:kindred_mobile/common/utils/json_convertible.dart';

abstract class BaseException extends JsonConvertible implements Exception {
  const BaseException();
}
