import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/feature/face_management/presentation/widgets/description_text.dart';

import '../../../../core/assets/app_images.dart';
import '../../../../generated/l10n.dart';
import '../../../main/data/models/buildings_res_params.dart';
import '../../../main/presentation/widgets/location_card.dart';
import '../widgets/free_service_active_card.dart';
import '../widgets/inactive_service_card.dart';

class PaymentPage extends StatelessWidget {
  final String? routName;
  final bool? hideBacButton;
  final List<Building> buildings;
  final bool? onlyActive;

  const PaymentPage({
    super.key,
    this.routName,
    this.hideBacButton,
    required this.buildings,
    this.onlyActive,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: routName ?? S.of(context).payment,
        hideBack: hideBacButton ?? true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 24.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 82,
                child: LocationCards(
                  buildings: buildings,
                ),
              ),
              const SizedBox(height: 24),
              DescriptionText(text: S.of(context).freeServices),
              const SizedBox(height: 16.0),
              FreeServiceActiveCard(
                serviceIcon: AppImages.phone,
                serviceName: S.of(context).smartIntercom,
              ),
              const SizedBox(height: 16.0),
              FreeServiceActiveCard(
                serviceIcon: AppImages.parking,
                serviceName: S.of(context).parking,
              ),
              onlyActive == null ? const SizedBox.shrink() : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  DescriptionText(text: S.of(context).outstandingBalance),
                  const SizedBox(height: 16.0),
                  InactiveServiceCard(
                    serviceName: S.of(context).smartIntercom,
                    serviceIcon: AppImages.phone,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
