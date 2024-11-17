import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';

class CustomFaceIndicator extends StatelessWidget {
  final double width;
  final double height;

  const CustomFaceIndicator({
    super.key,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppImages.faceDetection);
  }
}
