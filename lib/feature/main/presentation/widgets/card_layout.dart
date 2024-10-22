import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';

import '../../../../generated/l10n.dart';
import '../../../smart_intercom/presentation/pages/smart_intercom.dart';

class CardLayout extends StatelessWidget {
  final VoidCallback? onPress;
  final String iconPath;
  final String title;
  final bool blocked;
  final VoidCallback? comingSon;

  const CardLayout({
    super.key,
    this.onPress,
    required this.iconPath,
    required this.title,
    required this.blocked,
    this.comingSon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0, color: Colors.transparent),
              color: context.isDarkMode
                  ? AppColors.darkBackground
                  : AppColors.lightBackground),
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              blocked
                  ? Align(
                      alignment: const Alignment(1, .2),
                      child: _comingSonButton(),
                    )
                  : const SizedBox(),
              Opacity(
                opacity: blocked ? 0.3 : 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SvgPicture.asset(iconPath),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(iconPath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: context.isDarkMode
                                  ? AppColors.lightBackground
                                  : AppColors.darkBackground,
                            ),
                          ),
                        ),
                        blocked
                            ? const SizedBox()
                            : Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: context.isDarkMode
                                    ? AppColors.lightBackground
                                    : AppColors.darkBackground,
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _comingSonButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x199D0EDB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          S.current.comingSoon,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}