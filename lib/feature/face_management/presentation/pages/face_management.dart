import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/feature/face_management/presentation/widgets/face_card.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../common/widgets/basic_app_bar.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../smart_intercom/data/data_sources/deleted/stor.dart';
import 'generate_face.dart';

class FaceManagement extends StatelessWidget {
  final String address;

  const FaceManagement({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).faceManagement,
      ),
      backgroundColor: AppColors.whitBac,
      body: userList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 16.0,
                direction: Axis.vertical,
                clipBehavior: Clip.antiAlias,
                runSpacing: 16.0,
                alignment: WrapAlignment.spaceBetween,
                children: userList.map((user) {
                  return FaceCard(
                    userInfo: user,
                  );
                }).toList(),
              ),
            )
          : Center(
              child: SizedBox(
                width: 170,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppVectors.faceIcon),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).addYourFaceForQuickAndSecureAccessToYour,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff625B71),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: GenerateFacePage(
                            address: address,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Text(
                        S.of(context).addFace,
                        style:
                            const TextStyle(color: AppColors.lightBackground),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
