import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/main/presentation/bloc/building_display_cubit.dart';
import 'package:intelligent_security_systems/feature/main/presentation/bloc/building_display_state.dart';
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
      backgroundColor: AppColors.whitBac,
      body: BlocProvider(
        create: (context) => BuildingDisplayCubit()..getBuildingInformation(),
        child: BlocBuilder<BuildingDisplayCubit, BuildingDisplayState>(
          builder: (context, state) {
            if (state is BuildingLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BuildingLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 82,
                        child: LocationCards(
                          buildings: state.buildingsResParams.buildings,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Column(
                        children: state.buildingsResParams.buildings[0].devices
                            .map((devices) {
                          return CardLayout(
                            onPress: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: SmartIntercomPage(
                                  buildings: state.buildingsResParams.buildings,
                                ),
                                withNavBar:
                                    true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            iconPath: AppImages.phone,
                            title: devices.type,
                            blocked: devices.active == 0,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          CardLayout(
                            onPress: null,
                            iconPath: AppImages.elevator,
                            title: S.of(context).elevator,
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
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: CardLayout(
                              onPress: null,
                              iconPath: AppImages.barrier,
                              title: S.of(context).barrier,
                              blocked: true,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            /// ToDo add loading and defoult
            if (state is BuildingLoadFailure) {
              return Text(state.errorMessage);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
