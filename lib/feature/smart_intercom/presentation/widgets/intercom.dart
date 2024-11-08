import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/feature/camera_mode/presentation/pages/camera_mode.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../common/widgets/widget_or_null.dart';
import '../../../../core/assets/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../camera_mode/presentation/widgets/panel_active_item.dart';

class Intercom extends StatefulWidget {
  final bool locked;
  final String address;
  final int cameraId;

  const Intercom({
    super.key,
    required this.locked,
    required this.address,
    required this.cameraId,
  });

  @override
  State<Intercom> createState() => _IntercomState();
}

class _IntercomState extends State<Intercom> {

  bool lockedDoor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      decoration: ShapeDecoration(
        color: AppColors.lightBackground,
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
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 4.0,
              top: 12.0,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Text(
                    widget.address,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          widget.locked
              ? Container(
            height: 188,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  AppImages.media,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 70),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.withOpacity(0.1),
                  child: Text(
                    S.of(context).serviceWillResumeAfterPaymentIsReceived,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.10,
                    ),
                  ),
                ),
              ),
            ),
          )
              : GestureDetector(
            onTap: _navToCameraMode,
                child: Stack(
                  children: [
                    Image.asset(
                                AppImages.media,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: PanelActiveItem(
                          icon: lockedDoor ? Icons.lock_outline_rounded
                              : Icons.lock_open_rounded,
                          color: AppColors.lightBackground,
                          title: lockedDoor ? S.of(context).locked : S.of(context).open,
                        ),
                      ),
                    )
                  ],
                ),
              ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _payButton(onPress: _setOpenDoor, locked: widget.locked),
          )
        ],
      ),
    );
  }
  Widget _payButton({required VoidCallback onPress, required bool locked}) {
    return WidgetOrNull(
      status: locked,
      showWidget: Container(
        decoration: locked
            ? ShapeDecoration(
          gradient: const LinearGradient(
            end: Alignment(1.00, 0.05),
            begin: Alignment(-1, 0.05),
            colors: [Color(0xFFFF5456), Color(0xFFFF0004)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        )
            : const BoxDecoration(),
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: locked ? Colors.transparent : AppColors.primary,
          ),
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
                S.current.payDebt,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.lightBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      hideWidget: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: locked ? Colors.transparent : AppColors.primary,
        ),
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
              !lockedDoor ? S.of(context).toLock : S.of(context).open,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.lightBackground,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setOpenDoor(){
    setState(() {
      lockedDoor = !lockedDoor;
    });
  }

  void _navToCameraMode(){
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: CameraModePage(address: widget.address, cameraId: widget.cameraId,),
      withNavBar: false,
      pageTransitionAnimation:
      PageTransitionAnimation.cupertino,
    );
  }
}
