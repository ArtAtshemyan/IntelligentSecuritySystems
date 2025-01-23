import 'package:flutter/material.dart';

import '../../../../common/widgets/widget_or_null.dart';
import '../../../../core/theme/app_colors.dart';

class IdentityCard extends StatelessWidget {
  final String title;
  final int deviceId;
  final bool activeStatus;
  final void Function(int) onPress;

  const IdentityCard({
    super.key,
    required this.title,
    required this.deviceId,
    required this.activeStatus,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(deviceId),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color:
              activeStatus ? AppColors.lightPrimary : AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
            side: activeStatus
                ? const BorderSide(width: 0.0, color: Colors.transparent)
                : const BorderSide(width: 1, color: Color(0xFF79747E)),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetOrNull(
                status: activeStatus,
                showWidget: const Icon(Icons.check_sharp)),
            const SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.darkBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
