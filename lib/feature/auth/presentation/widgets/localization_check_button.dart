import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/bloc/localization_cubit.dart';

import '../../../../core/theme/app_colors.dart';

class LocalizationCheckButton extends StatelessWidget {
  final String langCode;
  final VoidCallback onPress;
  final String iconPath;
  final String name;

  const LocalizationCheckButton({
    super.key,
    required this.onPress,
    required this.iconPath,
    required this.name,
    required this.langCode,
  });

  @override
  Widget build(BuildContext context) {
    bool active =
        langCode == context.watch<LocalizationCubit>().state.toString();

    return IconButton(
      onPressed: onPress,
      icon: ClipOval(
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(
                  color: active
                      ? AppColors.primary.withOpacity(0.080)
                      : Colors.white.withOpacity(0.5),
                  width: 1.0,
                ),
                color: active
                    ? AppColors.primary.withOpacity(0.080)
                    : Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    fit: BoxFit.none,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: active ? AppColors.primary : AppColors.darkBlue,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
