import '../../../core/error/error_enum.dart';

extension ErrorFieldKey on ErrorField {
  String get key {
    switch (this) {
      case ErrorField.email:
        return "email";
      case ErrorField.password:
        return "password";
      case ErrorField.phone:
        return "phone";
    }
  }
}