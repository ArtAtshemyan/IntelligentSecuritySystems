import 'package:intelligent_security_systems/common/helpers/extension/response_extension.dart';

import 'error_enum.dart';

class ApiResponse {
  final String? message;
  final Map<String, List<String>> errors;

  ApiResponse({
    required this.message,
    required this.errors,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      message: json['message'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(
          key,
          List<String>.from(value),
        ),
      ) ??
          {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errors': errors.map((key, value) => MapEntry(key, value)),
    };
  }

  // Method to get error message for a specific field if it exists
  String? getErrorForField(ErrorField field) {
    return errors[field.key]?.first;
  }
}
