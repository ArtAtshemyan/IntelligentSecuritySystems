import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/bloc/button/button_state.dart';
import 'package:intelligent_security_systems/common/bloc/button/button_state_cubit.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/helpers/extension/validation.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/signup_req_params.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/signup.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/pages/sign_in.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/pages/verification.dart';

import '../../../../common/helpers/utils/input_utils.dart';
import '../../../../common/helpers/utils/password_strength_checker.dart';
import '../../../../common/widgets/basic_button.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../../core/error/error_enum.dart';
import '../../../../generated/l10n.dart';
import '../../../../service_locator.dart';
import '../widgets/localization_list_view.dart';
import '../widgets/password_strength.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  double _strength = 0;
  String? _phoneErrorText;
  String? _mailErrorText;

  @override
  void dispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
    _phoneCon.dispose();
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
                  builder: (context) => VerificationPage(
                    signupReq: SignupReqParams(
                      email: _emailCon.text,
                      phoneNumber: InputUtils.formatPhoneNumber(_phoneCon.text),
                      password: _passwordCon.text,
                    ),
                  ),
                ),
                (Route<dynamic> route) => false,
              );
            }
            if (state is ButtonFailureState) {
              final emailError = state.errorMessage.getErrorForField(ErrorField.email);
              final phoneError = state.errorMessage.getErrorForField(ErrorField.phone);
              if (emailError != null) {
                setState(() {
                  _mailErrorText = emailError;
                });
              }else if(phoneError != null){
                setState(() {
                  _phoneErrorText = phoneError;
                });
              }
              else {
                var snackBar = SnackBar(
                  content: Text(state.errorMessage.message??S.of(context).unknownException),
                  backgroundColor: AppColors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 32.0,
                left: 16.0,
                right: 16.0,
                bottom: 10,
              ),
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
                    const SizedBox(height: 16.0),
                    _phoneNumberField(),
                    const SizedBox(height: 16.0),
                    _emailField(),
                    const SizedBox(height: 16.0),
                    _password(),
                    const SizedBox(height: 4),
                    PasswordStrength(
                      password: _passwordCon.text,
                      strength: _strength,
                    ),
                    const SizedBox(height: 16),
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
      bottomNavigationBar: const LocalizationListView(),
    );
  }

  Widget _signup() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        S.of(context).signUp,
        textAlign: TextAlign.start,
        style: TextStyle(
          color:
              context.isDarkMode ? AppColors.lightBackground : AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 0.06,
        ),
      ),
    );
  }

  Widget _desc() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        S.of(context).signupDescription,
        textAlign: TextAlign.start,
        style: TextStyle(
          color:
              context.isDarkMode ? AppColors.lightBackground : AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
      ),
    );
  }

  Widget _phoneNumberField() {
    return TextFormField(
      onTap: (){
        if(_phoneErrorText != null){
          setState(() {
            _phoneErrorText = null;
          });
        }
      },
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        InputUtils.maskFormatter,
      ],
      controller: _phoneCon,
      decoration: InputDecoration(
        errorText: _phoneErrorText,
        labelText: S.of(context).phoneNumber,
        prefix: Text(
          '374 ',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: context.isDarkMode
                ? AppColors.lightBackground
                : AppColors.darkGrey,
          ),
        ),
        suffixIcon: _phoneCon.text.isNotEmpty
            ? _phoneErrorText == null
                ? IconButton(
                    onPressed: () {
                      clearController(_phoneCon);
                    },
                    icon: SvgPicture.asset(AppVectors.close),
                  )
                : const Icon(
                    Icons.error_outline_outlined,
                    color: AppColors.red,
                  )
            : null,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset(
            AppVectors.flagArmenia,
          ),
        ),
      ),
      validator: (value) {
        String unmaskPhoneNumber = InputUtils.unmaskPhoneNumber(value!);
        return unmaskPhoneNumber.isValidPhoneNumber;
      },
    );
  }

  Widget _emailField() {
    return TextFormField(
      onTap: (){
        if(_mailErrorText != null){
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
      onChanged: (text) {
        updatePasswordStrength(text);
      },
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
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: S.of(context).signUp,
          onPressed: _emailCon.text.isNotEmpty &&
                  _phoneCon.text.isNotEmpty &&
                  _passwordCon.text.isNotEmpty &&
                  PasswordStrengthChecker.getStrengthLabel(_strength) ==
                      S.of(context).strong
              ? () {
                  if (_signupFormKey.currentState?.validate() ?? false) {
                    context.read<ButtonStateCubit>().execute(
                          useCase: sl<SignupUseCase>(),
                          params: SignupReqParams(
                            email: _emailCon.text,
                            phoneNumber:
                                InputUtils.formatPhoneNumber(_phoneCon.text),
                            password: _passwordCon.text,
                          ),
                        );
                  }
                }
              : null,
        );
      },
    );
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
                ),
              ),
              TextSpan(
                text: ' ${S.of(context).signIn}',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
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

  void updatePasswordStrength(String password) {
    setState(() {
      _strength =
          PasswordStrengthChecker.checkPasswordStrength(_passwordCon.text);
    });
  }

  void clearController(TextEditingController controller) {
    controller.text = '';
    setState(() {});
  }
}
