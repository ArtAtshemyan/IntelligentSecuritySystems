import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';
import 'package:intelligent_security_systems/feature/main/presentation/widgets/card_layout.dart';
import 'package:intelligent_security_systems/feature/main/presentation/widgets/location_card.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../generated/l10n.dart';
import '../../../smart_intercom/presentation/pages/smart_intercom.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).home,
        action: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppVectors.notification),
        ),
        hideBack: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
                child: LocationCards(),
              ),
              const SizedBox(height: 40),
              CardLayout(
                onPress: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const SmartIntercomPage(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                iconPath: AppImages.phone,
                title: S.of(context).smartIntercom,
                blocked: false,
              ),
              const SizedBox(height: 16),
              CardLayout(
                onPress: null,
                iconPath: AppImages.camera,
                title: S.of(context).surveillanceCameras,
                blocked: true,
              ),
              const SizedBox(height: 16),
              CardLayout(
                onPress: null,
                iconPath: AppImages.barrier,
                title: S.of(context).barrier,
                blocked: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
