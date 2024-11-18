import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/feature/face_management/presentation/widgets/layout_card.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import 'min_card.dart';

class FreeServiceActiveCard extends StatelessWidget {
  final String serviceName;
  final String serviceIcon;

  const FreeServiceActiveCard(
      {super.key, required this.serviceName, required this.serviceIcon});

  @override
  Widget build(BuildContext context) {
    return LayoutCard(
      widget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(serviceIcon),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 1,
                  child: Text(
                    serviceName,
                    style: const TextStyle(
                      color: AppColors.darkBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    // color: AppColors.lightGreen,
                    color: const Color(0x191FDB0E).withOpacity(.10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).active,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          // color: AppColors.green,
                          color: Color(0xFF10B601),
                          
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            MinCard(
              cardName: S.of(context).cardAccess,
              cardIcon: Icons.check_circle_rounded,
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            Text(
              S.of(context).free,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              S.of(context).noServiceFee,
              style: const TextStyle(
                color: Color(0xFF625B71),
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
