class HelperFunctions {
  static String maskPhoneNumber(String phoneNumber) {
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[\(\)\s-]'), '');
    String fullPhoneNumber = '+374$cleanedNumber';
    if (fullPhoneNumber.length == 12) {
      return '${fullPhoneNumber.substring(0, 4)} ** ** ** ${fullPhoneNumber.substring(10, 12)}';
    }
    return fullPhoneNumber;
  }
}