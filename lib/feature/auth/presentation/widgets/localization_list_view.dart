import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';

import '../../../../core/assets/app_vectors.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../bloc/localization_cubit.dart';
import 'localization_check_button.dart';

class LocalizationListView extends StatelessWidget {
  const LocalizationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocalizationCheckButton(
                  onPress: () {
                    context
                        .read<LocalizationCubit>()
                        .updateLocale(const Locale('hy'));
                  },
                  iconPath: AppVectors.flagArmenia,
                  name: 'Հայ',
                  langCode: 'hy',
                ),
                const SizedBox(width: 16),
                LocalizationCheckButton(
                  onPress: () {
                    context
                        .read<LocalizationCubit>()
                        .updateLocale(const Locale('en'));
                  },
                  iconPath: AppVectors.flagUs,
                  name: 'Eng',
                  langCode: 'en',
                ),
                const SizedBox(width: 16),
                LocalizationCheckButton(
                  onPress: () {
                    context.read<LocalizationCubit>().updateLocale(
                          const Locale('ru'),
                        );
                  },
                  iconPath: AppVectors.flagRussia,
                  name: 'Рус',
                  langCode: 'ru',
                ),
              ],
            ),
            const SizedBox(height: 34),
            Text(
              S.of(context).bySigningUpYouAutomaticallyAgreeToOur,
              style: TextStyle(
                fontSize: 12,
                color: context.isDarkMode ? AppColors.lightBackground : AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    S.of(context).privacyPolicy,
                    style: TextStyle(
                      fontSize: 12,
                      color: context.isDarkMode ? AppColors.lightBackground : AppColors.black,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: context.isDarkMode ? AppColors.lightBackground : AppColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(S.of(context).and),
                ),
                GestureDetector(
                  child: Text(
                    S.of(context).termsConditions,
                    style: TextStyle(
                      fontSize: 12,
                      color: context.isDarkMode ? AppColors.lightBackground : AppColors.black,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: context.isDarkMode ? AppColors.lightBackground : AppColors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
