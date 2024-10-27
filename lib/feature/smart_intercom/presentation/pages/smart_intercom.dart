import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class SmartIntercomPage extends StatelessWidget {
  const SmartIntercomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
          title: S.of(context).smartIntercom,
          action: IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(CupertinoIcons.person_add),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 332,
                  child: ListView(
                    itemExtent: 360,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(3),
                    children: [
                      _cameraComp(context,false, 'Azatutyun 20'),
                      _cameraComp(context,true, '6 Vratsakan st.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
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
                SizedBox(
                  height: 140,
                  child: ListView(
                    itemExtent: 250,
                    padding: const EdgeInsets.all(3),
                    scrollDirection: Axis.horizontal,
                    children: [
                      _toolsItems(context,(){},AppImages.qrScan,S.of(context).accessByQrCode),
                      _toolsItems(context,(){},AppImages.faceScan,S.of(context).faceManagement),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _cameraComp(BuildContext context,bool locked, String address) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        child: Container(
          decoration: ShapeDecoration(
            color: context.isDarkMode
                ? AppColors.darkBackground
                : AppColors.lightBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.location),
                    const SizedBox(width: 4),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Text(
                        address,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ),
              Image.asset(AppImages.media),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _payButton(locked),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _payButton(bool locked) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: locked ? AppColors.red : AppColors.primary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          locked
              ? const SizedBox()
              : const Icon(
                  Icons.lock_open_sharp,
                  color: AppColors.lightBackground,
                  size: 18,
                ),
          const SizedBox(width: 8),
          Text(
            locked ? S.current.payDebt : S.current.open,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.lightBackground,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _toolsItems(BuildContext context, VoidCallback action, String iconPath,
      String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: action,
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
                borderRadius: BorderRadius.circular(12),
              ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: context.isDarkMode
                            ? AppColors.lightBackground
                            : AppColors.darkGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
