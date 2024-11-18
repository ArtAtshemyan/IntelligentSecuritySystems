import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/main/data/models/buildings_res_params.dart';
import 'package:intelligent_security_systems/feature/main/presentation/pages/main.dart';
import 'package:intelligent_security_systems/feature/payment/presentation/pages/payment.dart';
import 'package:intelligent_security_systems/feature/profile/presentation/pages/profile.dart';
import 'package:intelligent_security_systems/feature/smart_Intercom/presentation/pages/access_by_qr_code.dart';
import 'package:intelligent_security_systems/feature/smart_Intercom/presentation/pages/smart_intercom.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../generated/l10n.dart';
import '../../../main/presentation/bloc/building_display_cubit.dart';
import '../../../main/presentation/bloc/building_display_state.dart';
import '../../../qr_code/presentation/pages/generate_qr_code.dart';

class HomeNavigationPage extends StatefulWidget {
  const HomeNavigationPage({super.key});

  @override
  State<HomeNavigationPage> createState() => _HomePageState();
}

class _HomePageState extends State<HomeNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildingDisplayCubit()..getBuildingInformation(),
      child: BlocBuilder<BuildingDisplayCubit, BuildingDisplayState>(
        builder: (context, state) {
          if (state is BuildingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BuildingLoaded) {
            return PersistentTabView(
              context,
              controller: _controller,
              screens: [
                MainPage(buildingsResParams: state.buildingsResParams),
                AccessByQrCodePage(
                  deviceList: state.buildingsResParams.buildings[0].devices,
                  staticAddress: true,
                  address: state.buildingsResParams.buildings[0].address,
                ),
                PaymentPage(buildings: state.buildingsResParams.buildings,onlyActive: false,),
                ProfilePage(buildingsResParams: state.buildingsResParams,),
              ],
              items: _navBarsItems(state.buildingsResParams),
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              stateManagement: true,
              hideNavigationBarWhenKeyboardAppears: true,
              padding: const EdgeInsets.only(top: 12, bottom: 6.0),
              backgroundColor: context.isDarkMode
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
              isVisible: true,
              animationSettings: const NavBarAnimationSettings(
                navBarItemAnimation: ItemAnimationSettings(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimationSettings(
                  animateTabTransition: true,
                  duration: Duration(milliseconds: 100),
                  screenTransitionAnimationType:
                      ScreenTransitionAnimationType.fadeIn,
                ),
              ),
              confineToSafeArea: true,
              navBarHeight: 80,
              navBarStyle: NavBarStyle.style6,
              decoration: NavBarDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: const Color(0xff79747E).withOpacity(0.3),
                  ),
                ),
              ),
            );
          }
          if (state is BuildingLoadFailure) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildingsResParams buildings) {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(
          Icons.home_outlined,
        ),
        icon: _iconLayout(
          Icons.home,
        ),
        iconSize: 24,
        title: (S.of(context).home),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        // scrollController: _scrollController1,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/home",
          routes: {
            "/smart_intercom": (final context) => const SmartIntercomPage(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(
          Icons.qr_code,
        ),
        icon: _iconLayout(
          Icons.qr_code,
        ),
        iconSize: 24,
        title: (S.of(context).tabBarQrCodes),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        // scrollController: _scrollController1,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/qr_code",
          routes: {
            "/qr_generation": (final context) => GenerateQrCodePage(
                  staticAddress: false,
                  devices: buildings.buildings[0].devices,
                ),
          },
        ),
      ),
      /// Todo Padding icons and text
      PersistentBottomNavBarItem(
        icon: _iconLayout(
          Icons.verified_user,
        ),
        inactiveIcon: const Icon(
          Icons.verified_user_outlined,
        ),
        iconSize: 24,
        title: (S.of(context).services),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        // scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/payment",
          routes: {
            "/payment": (final context) => PaymentPage(buildings: buildings.buildings,),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: _iconLayout(
          CupertinoIcons.profile_circled,
        ),
        inactiveIcon: const Icon(
          CupertinoIcons.profile_circled,
        ),
        iconSize: 24,
        title: (S.of(context).profile),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        // scrollController: _scrollController3,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/profile",
          routes: {
            "/profile": (final context) => ProfilePage(buildingsResParams: buildings,),
          },
        ),
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  Widget _iconLayout(IconData icon) {
    return Container(
      width: 64,
      height: 32,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x199D0EDB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
