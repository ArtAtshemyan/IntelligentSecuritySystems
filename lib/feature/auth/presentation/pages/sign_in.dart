import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/helpers/extension/validation.dart';
import 'package:intelligent_security_systems/common/widgets/basic_button.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/pages/signup.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/helpers/utils/device_utils.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../../core/error/error_enum.dart';
import '../../../../core/firebase/notifications_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../service_locator.dart';
import '../../../home/presentation/pages/home_navigation.dart';
import '../../data/models/signin_req_params.dart';
import '../../domain/usecases/sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();
  late DeviceInformation _deviceInformation;
  late String _deviceToken;
  bool _obscureText = true;
  String? _mailErrorText;

  @override
  void initState() {
    super.initState();
    _getDeviceInformation();
  }

  @override
  void dispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
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
              final emailError =
                  state.errorMessage.getErrorForField(ErrorField.email);
              if (emailError != null) {
                setState(() {
                  _mailErrorText = emailError;
                });
              } else {
                var snackBar = SnackBar(
                  content: Text(state.errorMessage.message ??
                      S.of(context).unknownException),
                  backgroundColor: AppColors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
              child: Form(
                onChanged: () {
                  setState(() {});
                },
                key: _signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _signup(),
                    _desc(),
                    const SizedBox(height: 16),
                    _emailField(),
                    const SizedBox(height: 24),
                    _password(),
                    const SizedBox(height: 32),
                    _createAccountButton(context),
                    const SizedBox(height: 16),
                    _signInText(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signup() {
    return Text(
      S.of(context).signIn,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 0.06,
      ),
    );
  }

  Widget _desc() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        S.of(context).signinDescription,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: context.isDarkMode
              ? AppColors.lightBackground
              : AppColors.darkBackground,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 0.25,
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      onTap: () {
        if (_mailErrorText != null) {
          setState(() {
            _mailErrorText = null;
          });
        }
      },
      controller: _emailCon,
      decoration: InputDecoration(
        errorText: _mailErrorText,
        suffixIcon: _emailCon.text.isNotEmpty
            ? _mailErrorText == null
                ? IconButton(
                    onPressed: () {
                      clearController(_emailCon);
                    },
                    icon: SvgPicture.asset(AppVectors.close),
                  )
                : const Icon(
                    Icons.error_outline_outlined,
                    color: AppColors.red,
                  )
            : null,
        hintText: S.of(context).email,
        labelText: S.of(context).email,
      ),
      validator: (value) => value!.isValidEmail,
    );
  }

  Widget _password() {
    return TextFormField(
      autocorrect: true,
      controller: _passwordCon,
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off_sharp),
        ),
        hintText: S.of(context).password,
        labelText: S.of(context).password,
      ),
      validator: (value) => value!.isValidPassword,
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicAppButton(
        title: S.of(context).signIn,
        onPressed: _passwordCon.text.isNotEmpty && _emailCon.text.isNotEmpty
            ? () {
                if (_signupFormKey.currentState?.validate() ?? false) {
                  context.read<ButtonStateCubit>().execute(
                        useCase: sl<SignInUseCase>(),
                        params: SignInReqParams(
                          email: _emailCon.text,
                          password: _passwordCon.text,
                          deviceId: _deviceInformation.deviceId,
                          deviceModel: _deviceInformation.deviceName,
                          deviceToken: _deviceToken,
                          deviceOs: Platform.operatingSystem,
                        ),
                      );
                }
              }
            : null,
      );
    });
  }

  Widget _signInText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: S.of(context).doYouHaveAccount,
                  style: TextStyle(
                    color: context.isDarkMode
                        ? AppColors.lightBackground
                        : AppColors.darkBackground,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(
                text: ' ${S.of(context).signUp}',
                style: const TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearController(TextEditingController controller) {
    controller.text = '';
    setState(() {});
  }

  Future<void> _getDeviceInformation() async {
    DeviceUtils deviceUtils = DeviceUtils();
    NotificationService notificationService = NotificationService();
    _deviceToken =  await notificationService.getDeviceToken();
    _deviceInformation = await deviceUtils.getDeviceInfo();
    setState(() {});
  }
}
