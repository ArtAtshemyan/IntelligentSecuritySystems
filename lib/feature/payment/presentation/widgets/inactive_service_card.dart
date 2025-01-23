import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/feature/payment/presentation/widgets/min_card.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../face_management/presentation/widgets/layout_card.dart';

class InactiveServiceCard extends StatelessWidget {
  final String serviceName;
  final String serviceIcon;
  final String? serviceDevices;

  const InactiveServiceCard({
    super.key,
    required this.serviceName,
    required this.serviceIcon,
    this.serviceDevices,
  });

  @override
  Widget build(BuildContext context) {
    List<String> deviceList = [
      'Video Call',
      'QR Code',
      'Face Recognation',
      'Video Controller'
    ];
    List<IconData> deviceIconList = [
      Icons.videocam,
      Icons.qr_code,
      Icons.face,
      Icons.video_settings
    ];

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
                    color: const Color(0x19DB0E0E),
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
                        S.of(context).inactive,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.red,
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
            Wrap(
              spacing: 16.0,
              direction: Axis.horizontal,
              clipBehavior: Clip.antiAlias,
              runSpacing: 16.0,
              children: deviceList.map((card) {
                return MinCard(
                  cardName: card,
                  cardIcon: deviceIconList[deviceList.indexOf(card)],
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            _amountText('-600'),
            const SizedBox(height: 8.0),
            _amountDescription(),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                S.of(context).payNow,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _amountText(String amount) {
    return Text(
      '$amount AMD',
      style: const TextStyle(
        color: Color(0xFFFF0004),
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _amountDescription() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: S.current.serviceFee,
            style: const TextStyle(
              color: Color(0xFF625B71),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.40,
            ),
          ),
          const TextSpan(
            text: ' Please pay the due amount for your monthly package by ',
            style: TextStyle(
              color: Color(0xFF625B71),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.40,
            ),
          ),
          const TextSpan(
            text: '21.10.2024',
            style: TextStyle(
              color: Color(0xFF625B71),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.40,
            ),
          ),
          const TextSpan(
            text: ' to continue the service.',
            style: TextStyle(
              color: Color(0xFF625B71),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.40,
            ),
          ),
        ],
      ),
    );
  }
}
