import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/feature/smart_intercom/presentation/widgets/intercom.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../face_management/presentation/pages/face_management.dart';
import '../../../main/data/models/buildings_res_params.dart';
import 'access_by_qr_code.dart';

class SmartIntercomPage extends StatelessWidget {
  final List<Building>? buildings;
  const SmartIntercomPage({super.key, this.buildings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whitBac,
        appBar: BasicAppbar(
          title: S.of(context).smartIntercom,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Intercom(
                  locked: buildings![0].devices[0].active == 0,
                  address: buildings![0].address,
                  cameraId: buildings![0].devices[0].id,
                ),
                const SizedBox(height: 48.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).tools,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: context.isDarkMode
                            ? AppColors.lightBackground
                            : AppColors.darkBackground,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              shrinkWrap: true,
              childAspectRatio: 1.1,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _toolsItems(
                  context: context,
                  action: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: AccessByQrCodePage(
                        address: buildings![0].address,
                        deviceList: buildings![0].devices,
                        routName: S.of(context).smartIntercom,
                        staticAddress: true,
                        hideBacButton: false,
                      ),
                      withNavBar: false,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                  iconPath: AppImages.qrScan,
                  title: S.of(context).accessByQrCode,
                ),

                _toolsItems(
                  context: context,
                  action: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: FaceManagement(
                        address: buildings![0].address,
                      ),
                      withNavBar: false,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                  iconPath: AppImages.faceScan,
                  title: S.of(context).faceManagement,
                ),
              ],
            )
              ],
            ),
          ),
        ));
  }

  Widget _toolsItems({
    required BuildContext context,
    required VoidCallback action,
    required String iconPath,
    required String title,
  }) {
    return GestureDetector(
      onTap: action,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFF4EFF4)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            bottom: 24.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(iconPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.lightBackground
                      : AppColors.darkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
