import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputUtils {
  static final maskFormatter = MaskTextInputFormatter(
    mask: '(##) ##-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static String unmaskPhoneNumber(String maskedNumber) {
    return maskedNumber.replaceAll(RegExp(r'\D'), '');
  }
}
