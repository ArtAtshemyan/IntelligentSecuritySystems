import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/bloc/button/button_state.dart';
import 'package:intelligent_security_systems/common/bloc/button/button_state_cubit.dart';

import '../../core/theme/app_colors.dart';

class BasicTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;

  const BasicTextButton(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
          return TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.10,
              ),
            ),
          );
        },
      ),
    );
  }
}
