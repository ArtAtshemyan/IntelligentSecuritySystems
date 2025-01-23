import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class DeviceCard extends StatelessWidget {
  final String title;
  final int deviceId;
  final bool activeStatus;
  final void Function(int) onPress;

  const DeviceCard({
    super.key,
    required this.title,
    required this.deviceId,
    required this.activeStatus,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onPress(deviceId),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.lightBorder),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: const EdgeInsets.only(top: 12.0,bottom: 12.0, right: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              activeColor: AppColors.primary,
              value: activeStatus,
              onChanged: (value) => onPress(deviceId),
            ),
            Text(
              S.of(context).smartIntercom,
              style: const TextStyle(
                color: AppColors.darkBackground,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
