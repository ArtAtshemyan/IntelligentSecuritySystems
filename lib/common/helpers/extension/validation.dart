import '../../../generated/l10n.dart';

extension ValidationExtension on String {
  String? get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");
    String? result;
    if (!(emailRegExp.hasMatch(this))) {
      result = S.current.emailIncorrect;
    } else {
      result = null;
    }
    return result;
  }

  String? get isValidPhoneNumber {
    final phoneRegExp =
        RegExp(r"^(10|11|33|41|43|44|46|55|77|91|93|94|95|96|98|99)\d{6}$");
    String? result;
    if (isEmpty) {
      result = S.current.thisFieldIsRequired;
    } else if (!phoneRegExp.hasMatch(this)) {
      result = S.current.pleaseEnterAValidPhoneNumber;
    }
    return result;
  }

  String? get isValidPassword {
    String? result;
    if (isEmpty) {
      return S.current.thisFieldIsRequired;
    } else if (length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return result;
  }

  String? get isValidVerCode {
    final codeRegExp = RegExp(r"^\d{6}$");
    String? result;
    if (isEmpty) {
      result = S.current.thisFieldIsRequired;
    } else if (!(codeRegExp.hasMatch(this))) {
      result = S.current.invalidVerificationCode;
    }
    return result;
  }
}
