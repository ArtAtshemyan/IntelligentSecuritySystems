import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';

import '../../../generated/l10n.dart';

class PasswordStrengthChecker {
  static double checkPasswordStrength(String password) {
    int criteriaMet = 0;

    if (password.length >= 6) criteriaMet++;
    if (RegExp(r'[A-Z]').hasMatch(password)) criteriaMet++;
    if (RegExp(r'[a-z]').hasMatch(password)) criteriaMet++;
    if (RegExp(r'[0-9]').hasMatch(password)) criteriaMet++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) criteriaMet++;

    return criteriaMet / 5;
  }

  static String getStrengthLabel(double strength) {
    if (strength <= 0.4) {
      return S.current.weak;
    } else if (strength <= 0.6) {
      return S.current.medium;
    } else {
      return S.current.strong;
    }
  }

  static Color getStrengthColor(double strength) {
    if (strength <= 0.4) {
      return AppColors.red;
    } else if (strength <= 0.6) {
      return AppColors.orane;
    } else {
      return Colors.green;
    }
  }
}
