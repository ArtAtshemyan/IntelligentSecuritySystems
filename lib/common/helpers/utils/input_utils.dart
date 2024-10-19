import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputUtils {
  static final maskFormatter = MaskTextInputFormatter(
    mask: '(##) ##-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static String unmaskPhoneNumber(String maskedNumber) {
    return maskedNumber.replaceAll(RegExp(r'\D'), '');
  }

  static String formatPhoneNumber(String phoneNumber) {
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[\(\)\s-]'), '');
    String fullPhoneNumber = '374$cleanedNumber';
    return fullPhoneNumber;
  }

  static String maskPhoneNumber(String phoneNumber) {
    String fullPhoneNumber = '+$phoneNumber';
    if (fullPhoneNumber.length == 12) {
      return '${fullPhoneNumber.substring(0, 3)} ** ** ** ${fullPhoneNumber.substring(10, 12)}';
    }
    return fullPhoneNumber;
  }

}
