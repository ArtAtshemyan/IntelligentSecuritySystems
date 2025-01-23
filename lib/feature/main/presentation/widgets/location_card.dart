import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/widgets/widget_or_null.dart';
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
    return buildings.length > 1
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: buildings.length,
            itemExtent: MediaQuery.sizeOf(context).width - 64,
            itemBuilder: (BuildContext context, int index) {
              return _card(
                  context: context,
                  blocked: buildings[0].devices[0].active == 0,
                  address: buildings[index].address,
                  subTitle: buildings[index].id.toString());
            },
          )
        : Container(
            child: _card(
              context: context,
              blocked: buildings[0].devices[0].active == 0,
              address: buildings[0].address,
              subTitle: buildings[0].id.toString(),
            ),
          );
  }

  Widget _card({
    required BuildContext context,
    required bool blocked,
    required String address,
    String subTitle = '',
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: blocked ? ShapeDecoration(
        gradient: const LinearGradient(
          end: Alignment(1.00,0.05),
          begin: Alignment(-1,0.05),
          colors: [Color(0xFFFF5456), Color(0xFFFF0004)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ): ShapeDecoration(
        color: AppColors.lightBackground,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF79747E),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_pin,
            size: 24,
            color:
                blocked ? AppColors.lightBackground : AppColors.darkBackground,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: blocked
                        ? AppColors.lightBackground
                        : AppColors.darkBackground,
                  ),
                ),
                Text(
                  blocked ? S.of(context).debtDebAmd(-6000) : 'ID: $subTitle',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: blocked
                        ? AppColors.lightBackground
                        : AppColors.darkBackground,
                  ),
                ),
              ],
            ),
          ),
          WidgetOrNull(status: blocked, showWidget: _playButton(context)),
        ],
      ),
    );
  }

  Widget _playButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(elevation: 10),
      onPressed: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: PaymentPage(buildings: buildings,),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 6,
              offset: Offset(0, 2),
              spreadRadius: 2,
            ),BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0,
          ),
          child: Text(
            S.of(context).pay,
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
