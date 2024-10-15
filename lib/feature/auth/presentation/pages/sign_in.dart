import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/helpers/extension/validation.dart';
import 'package:intelligent_security_systems/common/widgets/basic_button.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/pages/signup.dart';

import '../../../../core/assets/app_vectors.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: _signup(),
                ),
                const SizedBox(
                  height: 16,
                ),
                _desc(),
                const SizedBox(height: 24),
                _emailField(),
                const SizedBox(height: 24),
                _password(),
                const SizedBox(height: 32),
                _createAccountButton(context, _signupFormKey),
                const SizedBox(
                  height: 20,
                ),
                _signInText(context)
              ],
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
      style: const TextStyle(
          color: Color(0xff1c1b1f), fontWeight: FontWeight.w700, fontSize: 24),
    );
  }

  Widget _desc() {
    return Text(
      S.of(context).signinDescription,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Color(0xff49454f),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      onChanged: (text) {
        setState(() {});
      },
      controller: _emailCon,
      decoration: InputDecoration(
        suffixIcon: _emailCon.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  clearController(_emailCon);
                },
                icon: SvgPicture.asset(AppVectors.close),
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
        setState(() {});
      },
      controller: _passwordCon,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon:
              Icon(obscureText ? Icons.visibility : Icons.visibility_off_sharp),
        ),
        hintText: S.of(context).password,
        labelText: S.of(context).password,
      ),
      validator: (value) => value!.isValidPassword,
    );
  }

  Widget _createAccountButton(
      BuildContext context, GlobalKey<FormState> formKey) {
    return BasicAppButton(
      title: S.of(context).signIn,
      onPressed: _emailCon.text.isNotEmpty && _passwordCon.text.isNotEmpty
          ? () {
              if (formKey.currentState?.validate() ?? false) {
                ///Todo: send response
              }
            }
          : null,
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: S.of(context).doYouHaveAccount,
              style: const TextStyle(
                  color: Color(0xff3B4054), fontWeight: FontWeight.w500)),
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
    );
  }

  void clearController(TextEditingController controller) {
    controller.text = '';
    setState(() {});
  }
}
