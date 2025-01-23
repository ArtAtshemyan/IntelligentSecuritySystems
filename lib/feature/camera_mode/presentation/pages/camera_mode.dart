import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/camera_mode/domain/entities/camera_control_button.dart';

import '../../../../core/assets/app_images.dart';
import '../../../../generated/l10n.dart';
import '../widgets/camera_control_button.dart';
import '../widgets/panel_active_item.dart';

class CameraModePage extends StatefulWidget {
  final String address;
  final int cameraId;

  const CameraModePage({
    super.key,
    required this.address,
    required this.cameraId,
  });

  @override
  State<CameraModePage> createState() => _CameraModePageState();
}

class _CameraModePageState extends State<CameraModePage> {
  List<int> activeControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: widget.address,
        backgroundColor: AppColors.darkBackground,
        titleColor: AppColors.lightBackground,
        iconColor: AppColors.lightBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            _cameraRecording(),
            SizedBox(
              height: 500,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: .60,
                    physics: const NeverScrollableScrollPhysics(),
                    children: cameraControlButtonList.map(
                      (el) {
                        return CameraControlButton(
                          activeIconColor: el.activeIconColor,
                          activeIcon: el.activeIcon,
                          inActiveIcon: el.inActiveIcon ?? el.activeIcon,
                          inActiveIconColor:
                              el.inActiveIconColor ?? el.activeIconColor,
                          onPress: (id) => _setDeviceActive(el.deviceId),
                          title: el.title,
                          active: activeControllers.contains(el.deviceId),
                          deviceId: el.deviceId,
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraRecording() {
    return Stack(
      children: [
        Image.asset(
          AppImages.videoRec,
          width: double.infinity,
          height: 300,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:  16.0,horizontal: 26.0),
            child: PanelActiveItem(
              icon: activeControllers.isNotEmpty
                  ? cameraControlButtonList[activeControllers.last].activeIcon
                  : Icons.lock_outline_rounded,
              color: activeControllers.isNotEmpty
                  ? cameraControlButtonList[activeControllers.last]
                      .activeIconColor
                  : AppColors.lightBackground,
              title: activeControllers.isNotEmpty
                  ? cameraControlButtonList[activeControllers.last].title
                  : S.of(context).locked,
            ),
          ),
        ),
      ],
    );
  }

  void _setDeviceActive(int id) {
    if (activeControllers.contains(id)) {
      activeControllers.remove(id);
    } else {
      activeControllers.add(id);
    }
    setState(() {});
  }
}
