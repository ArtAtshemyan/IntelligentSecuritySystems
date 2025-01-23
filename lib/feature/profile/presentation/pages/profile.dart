import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/common/widgets/basic_text_button.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/log_out.dart';
import 'package:intelligent_security_systems/feature/payment/presentation/pages/payment.dart';
import 'package:intelligent_security_systems/feature/profile/presentation/pages/change_password.dart';
import 'package:intelligent_security_systems/feature/profile/presentation/pages/personal_information.dart';
import 'package:intelligent_security_systems/feature/profile/presentation/widgets/profile_avatar.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../../service_locator.dart';
import '../../../auth/presentation/pages/signup.dart';
import '../../../main/data/models/buildings_res_params.dart';
import '../../../payment/presentation/pages/payment_method.dart';
import 'change_language.dart';

class ProfilePage extends StatelessWidget {
  final BuildingsResParams buildingsResParams;
  const ProfilePage({super.key, required this.buildingsResParams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitBac,
      appBar: BasicAppbar(
        title: S.of(context).profile,
        hideBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const ProfileAvatar(),
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
                    iconPath: Icons.account_circle,
                    title: S.of(context).personalInformation,
                    notCount: 0,
                    onPress: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PersonalInformationPage(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _profileControlItem(
                    context: context,
                    iconPath: Icons.how_to_reg,
                    title: S.of(context).activeService,
                    notCount: 1,
                    onPress: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: PaymentPage(
                          buildings: buildingsResParams.buildings,
                          routName: S.of(context).activeService,
                          hideBacButton: false,
                        ),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _profileControlItem(
                    context: context,
                    iconPath: Icons.credit_card,
                    title: S.of(context).paymentMethods,
                    notCount: 3,
                    onPress: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PaymentMethodPage(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                        PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            _profileControlItem(
              context: context,
              iconPath: Icons.password,
              title: S.of(context).changePassword,
              notCount: 0,
              onPress: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ChangePasswordPage(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation:
                  PageTransitionAnimation.cupertino,
                );
              },
            ),
            const SizedBox(height: 16.0),
            _profileControlItem(
              context: context,
              iconPath: Icons.language,
              title: S.of(context).changeLanguage,
              notCount: 0,
              onPress: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ChangeLanguagePage(),
                  withNavBar: false,
                  pageTransitionAnimation:
                  PageTransitionAnimation.cupertino,
                );
              },
            ),
            const SizedBox(height: 16.0),
            _profileControlItem(
              context: context,
              iconPath: Icons.logout,
              title: S.of(context).logOut,
              notCount: 0,
              onPress: () => showLogOutDialog(context)
            ),
          ],
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
    required IconData iconPath,
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
              Icon(iconPath,size: 24.0,),
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

  Widget _logOutButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicTextButton(
        onPressed: () {
          context
              .read<ButtonStateCubit>()
              .execute(useCase: sl<LogOutInUseCase>());
        },
        title: S.of(context).logOut,
      );
    });
  }

  void showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                  (Route<dynamic> route) => false,
                );
              }
            },
            child: AlertDialog(
              contentPadding: const EdgeInsets.all(24.0),
              title: Text(
                S.of(context).logOut,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Text(
                S.of(context).logOutText,
                style: const TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    S.of(context).canc,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.10,
                    ),
                  ),
                ),
                _logOutButton(context)
              ],
            ),
          ),
        );
      },
    );
  }
}
