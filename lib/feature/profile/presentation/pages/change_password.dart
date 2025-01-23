import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/validation.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/helpers/utils/password_strength_checker.dart';
import '../../../../common/widgets/basic_button.dart';
import '../../../../core/error/error_enum.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/widgets/password_strength.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _repeatPasswordCon = TextEditingController();
  final _changePasswordFormKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  double _strength = 0;
  // String? _repeatPasswordErrorText;
  // String? _oldPasswordErrorText;
  // String? _passwordErrorText;

  @override
  void dispose() {
    _oldPasswordCon.dispose();
    _passwordCon.dispose();
    _repeatPasswordCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).changePassword,
      ),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {}
            if (state is ButtonFailureState) {
              final passwordError =
                  state.errorMessage.getErrorForField(ErrorField.password);
              if (passwordError != null) {
                // setState(() {
                //   _passwordErrorText = passwordError;
                // });
              }
            } else {
              // var snackBar = SnackBar(
              //   content: Text(state.errorMessage.message ??
              //       S.of(context).unknownException),
              //   backgroundColor: AppColors.red,
              // );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    _oldPassword(),
                    const SizedBox(height: 10.0),
                    _password(),
                    const SizedBox(height: 10.0),
                    _repPassword(),
                    const SizedBox(height: 4),
                    PasswordStrength(
                      password: _passwordCon.text,
                      strength: _strength,
                    ),
                    const SizedBox(height: 48.0),
                    _changePasswordButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _oldPassword() {
    return TextFormField(
      autocorrect: true,
      onChanged: (text) {
        updatePasswordStrength(text);
      },
      controller: _passwordCon,
      obscureText: true,
      decoration: InputDecoration(
        hintText: S.of(context).oldPassword,
        labelText: S.of(context).oldPassword,
      ),
      validator: (value) => value!.isValidPassword,
    );
  }

  Widget _password() {
    return TextFormField(
      autocorrect: true,
      onChanged: (text) {
        updatePasswordStrength(text);
      },
      controller: _passwordCon,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off_sharp),
        ),
        hintText: S.of(context).newPassword,
        labelText: S.of(context).newPassword,
      ),
      validator: (value) => value!.isValidPassword,
    );
  }

  Widget _repPassword() {
    return TextFormField(
      autocorrect: true,
      onChanged: (text) {
        updatePasswordStrength(text);
      },
      controller: _passwordCon,
      obscureText: _obscureRepeatPassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureRepeatPassword = !_obscureRepeatPassword;
            });
          },
          icon: Icon(
              _obscureRepeatPassword ? Icons.visibility : Icons.visibility_off_sharp),
        ),
        hintText: S.of(context).repeatPassword,
        labelText: S.of(context).repeatPassword,
      ),
      validator: (value) => value!.isValidPassword,
    );
  }

  Widget _changePasswordButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: S.of(context).changePassword,
          onPressed: _passwordCon.text.isNotEmpty &&
              _repeatPasswordCon.text.isNotEmpty &&
              _oldPasswordCon.text.isNotEmpty &&
              PasswordStrengthChecker.getStrengthLabel(_strength) ==
                  S.of(context).strong
              ? () {
            if (_changePasswordFormKey.currentState?.validate() ?? false) {
              // context.read<ButtonStateCubit>().execute(
                // useCase: sl<SignupUseCase>(),
                // params: SignupReqParams(
                //   email: _emailCon.text.trim(),
                //   phoneNumber:
                //   InputUtils.formatPhoneNumber(_phoneCon.text),
                //   password: _passwordCon.text,
                //   deviceOs: Platform.operatingSystem,
                //   deviceToken: _deviceToken,
                //   deviceId: _deviceInformation.deviceId,
                //   deviceModel: _deviceInformation.deviceName,
                // ),
              // );
            }
          }
              : null,
        );
      },
    );
  }

  void updatePasswordStrength(String password) {
    setState(() {
      _strength =
          PasswordStrengthChecker.checkPasswordStrength(_passwordCon.text);
    });
  }

}
