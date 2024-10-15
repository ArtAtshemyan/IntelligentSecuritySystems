import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/pages/signup.dart';

import '../../../common/widgets/basic_button.dart';
import '../../../core/assets/app_vectors.dart';
import '../../../generated/l10n.dart';
import '../bloc/theme_cubit.dart';
import '../widgets/theme_check_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).chooseMode,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: context.isDarkMode
                      ? AppColors.lightBackground
                      : AppColors.darkBackground,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ThemeCheckButton(
                    onTap: () {
                      context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                    },
                    iconPath: AppVectors.moon,
                    buttonDescription: S.of(context).darkMode,
                    color: context.isDarkMode
                        ? AppColors.lightBackground
                        : AppColors.darkBackground,
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  ThemeCheckButton(
                    onTap: () {
                      context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                    },
                    iconPath: AppVectors.sun,
                    buttonDescription: S.of(context).lightMode,
                    color: Colors.amber,
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              BasicAppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SignupPage(),
                    ),
                  );
                },
                title: S.of(context).cont,
              )
            ],
          ),
        ),
      ),
    );
  }
}
