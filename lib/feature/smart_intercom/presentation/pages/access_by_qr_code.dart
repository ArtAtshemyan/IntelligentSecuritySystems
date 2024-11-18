import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/main/data/models/buildings_res_params.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../generated/l10n.dart';
import '../../../qr_code/presentation/pages/generate_qr_code.dart';
import '../../data/data_sources/deleted/stor.dart';

class AccessByQrCodePage extends StatelessWidget {
  final String? address;
  final List<Device> deviceList;
  final bool staticAddress;
  final String? routName;
  final bool? hideBacButton;

  const AccessByQrCodePage({
    super.key,
    this.address,
    this.routName,
    this.hideBacButton,
    required this.deviceList,
    required this.staticAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: routName ?? S.of(context).accessByQrCode,
        hideBack: hideBacButton ?? true,
      ),
      backgroundColor: AppColors.whitBac,
      body: qrList.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: qrList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16.0);
              },
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 24,
                        offset: Offset(0, 8),
                        spreadRadius: 6,
                      )
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SvgPicture.string(
                            qrList[index],
                            width: 250,
                            height: 250,
                          ),
                          const SizedBox(height: 16.0),
                          const Divider(),
                          const SizedBox(height: 16.0),
                          _deviceDescription(deviceName: routName ?? ''),
                          const SizedBox(height: 16.0),
                          const Divider(),
                          const SizedBox(height: 8.0),
                          _subCardInformation(
                              icon: Icons.location_on, text: address ?? ''),
                          _subCardInformation(
                              icon: Icons.people, text: 'Family-Friends'),
                          _subCardInformation(
                              icon: Icons.access_time_outlined,
                              text: '2 hours',
                              isTimeItem: true),
                          const SizedBox(height: 24.0),
                          _shareButton('link'),
                        ],
                      )),
                );
              },
            )
          : Center(
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
                        fontSize: 14,
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
                            staticAddress: staticAddress,
                            devices: deviceList,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Text(
                        S.of(context).generateQrCode,
                        style:
                            const TextStyle(color: AppColors.lightBackground),
                      ),
                    )
                  ],
                ),
              ),
            ),
      floatingActionButton: qrList.isNotEmpty && Platform.isAndroid ? FloatingActionButton(
        backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        onPressed: (){
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: GenerateQrCodePage(
              address: address,
              staticAddress: staticAddress,
              devices: deviceList,
            ),
            withNavBar: false,
            pageTransitionAnimation:
            PageTransitionAnimation.cupertino,
          );
        },
        child: const Icon(Icons.add,color: AppColors.lightBackground,),
      ):null,
    );
  }

  Widget _subCardInformation(
      {required IconData icon, required String text, bool? isTimeItem}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            text,
            style: TextStyle(
              color:
                  isTimeItem != null ? AppColors.yellow : AppColors.lightGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0.10,
              letterSpacing: 0.25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _shareButton(String qrLink) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
            color: AppColors.primary, width: 1.0), // Цвет и толщина границы
      ),
      onPressed: () {
        Share.share(qrLink);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.share,
              size: 18,
              color: AppColors.primary,
            ),
            const SizedBox(width: 8.0),
            Text(
              S.current.share,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.10,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _deviceDescription({required String deviceName}){
    return Row(
      children: [
        Image.asset(
          deviceName == S.current.smartIntercom ?
          AppImages.phone : AppImages.elevator,
          width: 16,
          height: 30,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          deviceName,
          style: const TextStyle(
            color: AppColors.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
        ),
      ],
    );
  }
}
