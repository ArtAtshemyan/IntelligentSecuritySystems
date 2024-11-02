import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/payment/presentation/pages/payment.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/buildings_res_params.dart';

class LocationCards extends StatelessWidget {
  final List<Building> buildings;
  const LocationCards({required this.buildings, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: buildings.length,
      itemExtent: MediaQuery.sizeOf(context).width - 64,
      itemBuilder: (BuildContext context, int index) {
        return _card(
            context: context,
            blocked: true,
            address: buildings[index].address,
            subTitle: buildings[index].id.toString());
      },
    );
  }

  Widget _card({
    required BuildContext context,
    required bool blocked,
    required String address,
    String subTitle = '',
  }) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      tileColor: blocked ? AppColors.red : AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(color: Color(0xff79747E)),
      ),
      leading: Icon(
        Icons.location_pin,
        size: 24,
        color: blocked ? AppColors.lightBackground : AppColors.darkBackground,
      ),
      title: Text(
        address,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blocked ? AppColors.lightBackground : AppColors.darkBackground,
        ),
      ),
      subtitle: Text(
        blocked ? S.of(context).debtDebAmd(-6000) : 'ID: $subTitle',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: blocked ? AppColors.lightBackground : AppColors.darkBackground,
        ),
      ),
      trailing: blocked ? _playButton(context) : const SizedBox(),
    );
  }

  Widget _playButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(elevation: 10),
      onPressed: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const PaymentPage(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.lightBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10,
          ),
          child: Text(
            S.current.play,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.darkBackground,
            ),
          ),
        ),
      ),
    );
  }
}
