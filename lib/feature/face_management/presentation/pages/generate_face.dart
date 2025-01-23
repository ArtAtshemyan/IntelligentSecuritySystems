import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/feature/face_management/presentation/pages/face_registration.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class GenerateFacePage extends StatefulWidget {
  final String address;
  const GenerateFacePage({
    super.key,
    required this.address,
  });

  @override
  State<GenerateFacePage> createState() => _GenerateFacePageState();
}

class _GenerateFacePageState extends State<GenerateFacePage> {

  late FaceCameraController controller;

  @override
  void initState() {
    controller = FaceCameraController(
      autoCapture: false,
      defaultCameraLens: CameraLens.front,
      ignoreFacePositioning: true,
      performanceMode: FaceDetectorMode.fast,
      onCapture: (File? image) {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: FaceRegistrationPage(
            address: widget.address,
            image: image,
          ),
          withNavBar: false,
          pageTransitionAnimation:
          PageTransitionAnimation.cupertino,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: BasicAppbar(
        backgroundColor: AppColors.darkBackground,
        titleColor: AppColors.lightBackground,
        iconColor: AppColors.lightBackground,
        title: S.of(context).faceManagement,
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SmartFaceCamera(
                  controller: controller,
                  indicatorShape: IndicatorShape.image,
                  indicatorAssetImage: AppImages.faceDetection,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
