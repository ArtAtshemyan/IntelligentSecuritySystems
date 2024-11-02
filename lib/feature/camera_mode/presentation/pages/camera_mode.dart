import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';

import '../../../../core/assets/app_images.dart';
import '../../../../generated/l10n.dart';

class CameraModePage extends StatelessWidget {
  final String address;
  final int cameraId;
  const CameraModePage(
      {super.key, required this.address, required this.cameraId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: address,
      ),
      backgroundColor: AppColors.darkBackground,
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
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
                    childAspectRatio: 0.5,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _cameraControlButton(
                        context: context,
                        icon: CupertinoIcons.lock_fill,
                        onPress: () {},
                        title: S.of(context).open,
                        active: false,
                      ),
                      _cameraControlButton(
                        context: context,
                        icon: CupertinoIcons.mic_fill,
                        onPress: () {},
                        title: S.of(context).mute,
                        active: false,
                      ),
                      _cameraControlButton(
                        context: context,
                        icon: CupertinoIcons.speaker_2,
                        onPress: () {},
                        title: S.of(context).sound,
                        active: false,
                      ),
                      _cameraControlButton(
                        context: context,
                        icon: CupertinoIcons.smallcircle_fill_circle,
                        onPress: () {},
                        title: S.of(context).record,
                        active: true,
                      ),
                    ],
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
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.media,
              height: 300,
            ),
          ),
          Align(
            alignment: const Alignment(0.9, -0.5),
            child: _panelActiveItem(),
          ),
        ],
      ),
    );
  }

  Widget _panelActiveItem() {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.smallcircle_circle_fill,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            S.current.record,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 0.13,
              letterSpacing: 0.50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cameraControlButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onPress,
    required String title,
    required bool active
  }) {
    return Container(
      decoration: BoxDecoration(
        color: active? Colors.white.withOpacity(0.11999999731779099): Colors.transparent,
        border: const Border(
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
            icon,
            color: Colors.white,
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
    );
  }
}
