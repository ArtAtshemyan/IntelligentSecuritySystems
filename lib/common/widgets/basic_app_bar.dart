import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final Color? titleColor;
  final Color? iconColor;

  const BasicAppbar({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ??
          (context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground),
      elevation: 0.5,
      shadowColor: const Color(0xff79747E).withOpacity(0.3),
      centerTitle: false,
      title: Text(
        title ?? '',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: titleColor ?? (context.isDarkMode
              ? AppColors.lightBackground
              : AppColors.darkBackground),
        ),
      ),
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Platform.isAndroid
                    ? Icons.arrow_back_outlined
                    : Icons.arrow_back_ios_new,
                size: 22,
                color: iconColor ?? (context.isDarkMode
                    ? AppColors.lightBackground
                    : AppColors.darkBackground),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
