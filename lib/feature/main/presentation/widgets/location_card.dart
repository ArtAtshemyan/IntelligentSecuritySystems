import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/payment/presentation/pages/payment.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../generated/l10n.dart';

class LocationCards extends StatelessWidget {
  const LocationCards({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: 2,
    //   itemBuilder: (BuildContext context, int index) {
    //     return _card(true, 'Erevan', 'SSS');
    //   },
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _card(context,true, '6 Vratsakan st.', 'Debt: -6000 AMDSSS'),
        _card(context,false, 'Azatutyun 20', 'Condominium nam'),
      ],
    );
  }

  Widget _card(BuildContext context,bool deposit, String location, String subTitle) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 310,
      ),
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(right: 15, left: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              deposit ? const Color(0xFFFF5457) : const Color(0xFFE9C9F7),
              deposit ? const Color(0xFFFF0004) : const Color(0xFFD393EF),
            ],
            begin: const Alignment(-0.04, -1.0),
            end: const Alignment(1.0, 0.33),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppVectors.location,
                color: deposit
                    ? AppColors.lightBackground
                    : AppColors.darkBackground,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: deposit
                            ? AppColors.lightBackground
                            : AppColors.darkBackground,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: deposit
                            ? AppColors.lightBackground
                            : AppColors.darkBackground,
                      ),
                    ),
                  ],
                ),
              ),
              deposit ? _playButton(context) : const SizedBox(),
            ],
          ),
        ),
      ),
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
