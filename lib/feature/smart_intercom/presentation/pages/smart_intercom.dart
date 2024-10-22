import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/common/widgets/basic_button.dart';
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
                      _camerCopm(),
                      _camerCopm(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _camerCopm() {
    return Padding(
      padding: const EdgeInsets.only(right:  16.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        child: Container(
          decoration: ShapeDecoration(
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
                    const Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: const Text(
                        'Azatutyun 20',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ),
              Image.asset(AppImages.media),
              const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}
