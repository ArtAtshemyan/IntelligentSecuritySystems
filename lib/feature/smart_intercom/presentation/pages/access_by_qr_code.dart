import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/main/data/models/buildings_res_params.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../generated/l10n.dart';
import '../../../qr_code/presentation/pages/generate_qr_code.dart';

class AccessByQrCodePage extends StatelessWidget {
  final String? address;
  final List<Device> deviceList;
  const AccessByQrCodePage({super.key, this.address, required this.deviceList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).accessByQrCode,
      ),
      body: Center(
        child: SizedBox(
          width: 170,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppVectors.qrCodeGenerationIcon),
              const SizedBox(height: 16),
              Text(
                S.of(context).generateYourOneTimeQrCode,
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
                    screen: GenerateQrCodePage(
                      address: address,
                      staticAddress: true,
                      devices: deviceList,
                    ),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Text(
                  S.of(context).generateQrCode,
                  style: const TextStyle(color: AppColors.lightBackground),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
