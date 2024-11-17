import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';

import '../../../../core/theme/app_colors.dart';

class DescriptionText extends StatelessWidget {
  final String text;

  const DescriptionText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    );
  }
}
