import 'dart:convert';

abstract class JsonConvertible {
  const JsonConvertible();

  @override
  String toString() {
    const encoder = JsonEncoder.withIndent('    ');

    return encoder.convert(this);
  }

  Map<String, dynamic> toJson();
}
