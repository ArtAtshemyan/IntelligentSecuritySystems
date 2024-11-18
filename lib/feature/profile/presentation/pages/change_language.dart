import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/bloc/localization_cubit.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitBac,
      appBar: BasicAppbar(
        title: S.of(context).changeLanguage,
      ),
      body: BlocProvider(
        create: (_) => LocalizationCubit(),
        child: BlocBuilder<LocalizationCubit, Locale>(
          builder: (context, locale) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: ShapeDecoration(
                  color: context.isDarkMode
                      ? AppColors.darkBackground
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _languageChecking(
                        key: 'Հայերեն',
                        active: locale.toString() == 'hy',
                        onPress: () {
                          context
                              .read<LocalizationCubit>()
                              .updateLocale(const Locale('hy'));
                        }),
                    _languageChecking(
                        key: 'English',
                        active: locale.toString() == 'en',
                        onPress: () {
                          context
                              .read<LocalizationCubit>()
                              .updateLocale(const Locale('en'));
                        }),
                    _languageChecking(
                      key: 'Русский',
                      active: locale.toString() == 'ru',
                      onPress: () {
                        context
                            .read<LocalizationCubit>()
                            .updateLocale(const Locale('ru'));
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _languageChecking(
      {required String key,
      required bool active,
      required void Function() onPress}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 16.0,
            right: 24.0,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  key,
                  style: const TextStyle(
                    color: AppColors.darkBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
              Icon(
                active ? Icons.radio_button_checked : Icons.radio_button_off,
                color: active ? AppColors.primary : AppColors.darkBackground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
