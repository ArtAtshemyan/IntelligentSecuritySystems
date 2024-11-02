import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';

import '../../../../generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground.withOpacity(0.5),
      appBar: BasicAppbar(
        title: S.of(context).profile,
        hideBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _avatar(),
            _userFio(context: context, fio: 'Alica Vardanyan'),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(1),
              decoration: ShapeDecoration(
                color: context.isDarkMode
                    ? AppColors.darkBackground
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  _profileControlItem(
                    context: context,
                    iconPath: AppVectors.avatar,
                    title: S.of(context).personalInformation,
                    notCount: 0,
                    onPress: () {},
                  ),
                  _profileControlItem(
                    context: context,
                    iconPath: AppVectors.activeService,
                    title: S.of(context).activeService,
                    notCount: 1,
                    onPress: () {},
                  ),
                  _profileControlItem(
                    context: context,
                    iconPath: AppVectors.paymentService,
                    title: S.of(context).paymentMethods,
                    notCount: 3,
                    onPress: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            _profileControlItem(
              context: context,
              iconPath: AppVectors.changePassword,
              title: S.of(context).changePassword,
              notCount: 0,
              onPress: () {},
            ),
            const SizedBox(height: 16.0),
            _profileControlItem(
              context: context,
              iconPath: AppVectors.logOut,
              title: S.of(context).logOut,
              notCount: 0,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.orange),
            shape: BoxShape.circle,

            /// ToDo profile Image use decoration Image
          ),
          child: const Icon(
            Icons.person,
            size: 100,
          ),
        ),
      ),
    );
  }

  Widget _userFio({required BuildContext context, required String fio}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          fio,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.isDarkMode
                ? AppColors.lightBackground
                : AppColors.darkBackground,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 0.09,
            letterSpacing: 0.15,
          ),
        ),
      ),
    );
  }

  Widget _profileControlItem({
    required BuildContext context,
    required String iconPath,
    required String title,
    required int notCount,
    required VoidCallback onPress,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: ShapeDecoration(
          color: context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: TextStyle(
                    color: context.isDarkMode
                        ? AppColors.lightBackground
                        : AppColors.darkBackground,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                notCount > 0 ? '+ ${notCount.toString()}' : '',
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.lightBackground
                      : AppColors.darkBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.10,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
