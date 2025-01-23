import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';

import '../../../../core/theme/app_colors.dart';

class StaticAddress extends StatelessWidget {
  final String title;
  final String address;
  const StaticAddress({
    super.key,
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _description(desc: title, context: context),
        const SizedBox(height: 16),
        Opacity(
          opacity: 0.38,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColors.darkBackground,
                )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _description(desc: address, context: context),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text _description({required BuildContext context, required String desc}) {
    return Text(
      desc,
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
