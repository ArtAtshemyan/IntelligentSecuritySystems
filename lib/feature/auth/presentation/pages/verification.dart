import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/helpers/extension/validation.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/signup_req_params.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/verification_req_params.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/verification.dart';
import 'package:intelligent_security_systems/feature/home/presentation/pages/home_navigation.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/helpers/utils/device_utils.dart';
import '../../../../common/widgets/basic_button.dart';
import '../../../../core/firebase/notifications_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../service_locator.dart';

class VerificationPage extends StatefulWidget {
  final SignupReqParams signupReq;
  const VerificationPage({super.key, required this.signupReq});

  @override
  State<VerificationPage> createState() => _VerificationState();
}

class _VerificationState extends State<VerificationPage> {
  final TextEditingController _confirmCodeCon = TextEditingController();
  final _confirmFormKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  late DeviceInformation deviceInformation;
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _getDeviceInformation();
    notificationService.requestNotificationPermission();
    notificationService.getDeviceToken();
    notificationService.firebaseInit(context);
    notificationService.setupInteractMessage(context);
  }

  @override
  void dispose() {
    _confirmCodeCon.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeNavigationPage()),
                  (Route<dynamic> route) => false,
                );
              } else if (state is ButtonFailureState) {
                var snackBar = SnackBar(content: Text(state.errorMessage.message??S.of(context).unknownException));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: 16.0, right: 16.0, left: 16.0, bottom: 10.0),
                child: Form(
                  key: _confirmFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _verification(),
                      _desc(),
                      _confirmCodeField(),
                      _confirmButton(context)
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget _verification() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        S.of(context).verification,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: context.isDarkMode
              ? AppColors.lightBackground
              : AppColors.darkBackground,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _desc() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${S.of(context).SentDigitCode} ',
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.lightBackground
                    : AppColors.darkBackground,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
            ),
            TextSpan(
              text: '+374 ** ** ** ${widget.signupReq.phoneNumber.length - 1}',
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.lightBackground
                    : AppColors.darkBackground,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.25,
              ),
            ),
            const TextSpan(
              text: '.',
              style: TextStyle(
                color: Color(0xFF49454F),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmCodeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 32.0,
      ),
      child: Pinput(
        length: 6,
        focusNode: _focusNode,
        defaultPinTheme: PinTheme(
          width: 40,
          height: 56,
          textStyle: const TextStyle(
            color: Color(0xFF49454F),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.50,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGrey),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        validator: (value) {
          return value!.isValidVerCode;
        },
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        controller: _confirmCodeCon,
      ),
    );
  }

  Widget _confirmButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: S.of(context).next,
          onPressed: _confirmCodeCon.text.length > 5
              ? () {
                  if (_confirmFormKey.currentState?.validate() ?? false) {
                    context.read<ButtonStateCubit>().execute(
                          useCase: sl<VerificationUseCase>(),
                          params: VerificationReqParams(
                            email: widget.signupReq.email,
                            phoneNumber: widget.signupReq.phoneNumber,
                            password: widget.signupReq.password,
                            deviceId: deviceInformation.deviceId,
                            verificationConde: _confirmCodeCon.text,
                            deviceModel: deviceInformation.deviceName,
                          ),
                        );
                  }
                }
              : null,
        );
      },
    );
  }

  Future<void> _getDeviceInformation() async {
    DeviceUtils deviceUtils = DeviceUtils();
    deviceInformation = await deviceUtils.getDeviceInfo();
    setState(() {});
  }
}
