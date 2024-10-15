extension ValidationExtension on String {
  String? get isValidEmail {
    final emailRegExp = RegExp(r"^ [a-zA-Z0-9.]+@[a-zA-Z0-9.]+\. [a-zA-Z]");
    String? result;
    if (isEmpty) {
      result = 'This field is required';
    } else if (!(emailRegExp.hasMatch(this))) {
      result = 'enter valid email';
    }
    return result;
  }
}
