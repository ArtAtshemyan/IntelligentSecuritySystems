import 'package:flutter/material.dart';

class CameraControlButton extends StatelessWidget {
  final Color activeIconColor;
  final Color? inActiveIconColor;
  final IconData activeIcon;
  final IconData? inActiveIcon;
  final void Function(int) onPress;
  final String title;
  final bool active;
  final int deviceId;

  const CameraControlButton({
    super.key,
    required this.activeIconColor,
    this.inActiveIconColor,
    required this.activeIcon,
    this.inActiveIcon,
    required this.onPress,
    required this.title,
    required this.active,
    required this.deviceId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(deviceId),
      child: Container(
        decoration: BoxDecoration(
          color: active
              ? Colors.white.withOpacity(0.11999999731779099)
              : Colors.transparent,
          border: const Border(
            top: BorderSide(width: 0.50, color: Color(0xFF49454F)),
            left: BorderSide(width: 0.50, color: Color(0xFF49454F)),
            right: BorderSide(width: 0.50, color: Color(0xFF49454F)),
            bottom: BorderSide(width: 0.50, color: Color(0xFF49454F)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              active ? activeIcon : inActiveIcon ?? activeIcon,
              color: active ? activeIconColor : inActiveIconColor?? activeIconColor,
              size: 24.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 0.10,
                letterSpacing: 0.10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
