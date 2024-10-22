import 'package:flutter/cupertino.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/main/presentation/pages/main.dart';
import 'package:intelligent_security_systems/feature/payment/presentation/pages/payment.dart';
import 'package:intelligent_security_systems/feature/profile/presentation/pages/profile.dart';
import 'package:intelligent_security_systems/feature/smart_Intercom/presentation/pages/smart_intercom.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 12),
      backgroundColor: context.isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 80,
      navBarStyle: NavBarStyle.style6,

    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(
          CupertinoIcons.house_fill,
        ),
        icon: _iconLayout(
          CupertinoIcons.home,
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
        icon:  _iconLayout(
          CupertinoIcons.creditcard,
        ),
        inactiveIcon: const Icon(
            CupertinoIcons.creditcard_fill,
        ),
        iconSize: 24,
        title: (S.of(context).payment),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        // scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/payment",
          routes: {
            "/payment": (final context) => const PaymentPage(),
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
            "/profile": (final context) => const ProfilePage(),
          },
        ),
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return const [
      MainPage(),
      PaymentPage(),
      ProfilePage(),
    ];
  }

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

  // final ScrollController _scrollController1 = ScrollController(initialScrollOffset: 0);
  // final ScrollController _scrollController2 = ScrollController(initialScrollOffset: 0);
  // final ScrollController _scrollController3 = ScrollController(initialScrollOffset: 0);
}
