import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class CameraControlDevice {
  final Color activeIconColor;
  final Color? inActiveIconColor;
  final IconData activeIcon;
  final IconData? inActiveIcon;
  final void Function(int)? onPress;
  final String title;
  final bool? active;
  final int deviceId;

  CameraControlDevice({
    required this.activeIconColor,
    this.inActiveIconColor,
    required this.activeIcon,
    this.inActiveIcon,
    this.onPress,
    required this.title,
    this.active,
    required this.deviceId,
  });
}
List<CameraControlDevice> cameraControlButtonList = [
  CameraControlDevice(
    activeIcon: Icons.lock_open_outlined,
    title: S.current.open,
    deviceId: 0,
    activeIconColor: AppColors.lightBackground,
  ),
  CameraControlDevice(
    inActiveIcon: Icons.mic_none_sharp,
    activeIcon: Icons.mic_off_outlined,
    activeIconColor: AppColors.lightBackground,
    title: S.current.mute,
    deviceId: 1,
  ),
  CameraControlDevice(
    activeIcon: Icons.volume_off_outlined,
    inActiveIcon: Icons.volume_up_outlined,
    activeIconColor: AppColors.lightBackground,
    title: S.current.sound,
    deviceId: 2,
  ),
  CameraControlDevice(
    activeIcon: Icons.radio_button_checked,
    activeIconColor: AppColors.red,
    inActiveIconColor: AppColors.lightBackground,
    title: S.current.record,
    deviceId: 3,
  ),
];
