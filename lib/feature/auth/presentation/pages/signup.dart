import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/pages/signin.dart';

import '../../../../common/widgets/basic_button.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../../core/constants/input_utils.dart';
import '../../../../generated/l10n.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  bool obscureText = false;

  void clearController(TextEditingController controller) {
    controller.text = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: SingleChildScrollView(
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
              const SizedBox(
                height: 16,
              ),
              _phoneNumberField(),
              const SizedBox(
                height: 20,
              ),
              _emailField(),
              const SizedBox(
                height: 20,
              ),
              _password(),
              const SizedBox(
                height: 60,
              ),
              _createAccountButton(context),
              const SizedBox(
                height: 20,
              ),
              _signinText(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _signup() {
    return const Text(
      'Sign Up',
      textAlign: TextAlign.start,
      style: TextStyle(
          color: Color(0xff1c1b1f), fontWeight: FontWeight.w700, fontSize: 24),
    );
  }

  Widget _desc() {
    return const Text(
      'Sign up and easily access all the essential controls and features.',
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Color(0xff49454f),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }

  Widget _phoneNumberField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        InputUtils.maskFormatter,
      ],
      onChanged: (text) {
        setState(() {});
      },
      controller: _phoneCon,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        prefix: const Text(
          '374 ',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        suffixIcon: _phoneCon.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  clearController(_phoneCon);
                },
                icon: SvgPicture.asset(AppVectors.close),
              )
            : null,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset(
            AppVectors.flagArmenia,
          ),
        ),
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
        hintText: 'Email',
        labelText: 'Email',
      ),
    );
  }

  Widget _password() {
    return TextFormField(
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
            icon: Icon(
                obscureText ? Icons.visibility_off_sharp : Icons.visibility),
          ),
          hintText: 'Password',
          labelText: 'Password'),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return BasicAppButton(
        title: 'Create Account',
        onPressed: () {
          print([_emailCon, _phoneCon, _passwordCon]);
        });
  }
}

Widget _passwordStrenght() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
    child: Row(
      children: [
        Text(
          S.current.passwordStrenght,
          style: TextStyle(fontSize: 12),
        )
      ],
    ),
  );
}

Widget _signinText(BuildContext context) {
  return Text.rich(
    TextSpan(
      children: [
        const TextSpan(
            text: 'Do you have account?',
            style: TextStyle(
                color: Color(0xff3B4054), fontWeight: FontWeight.w500)),
        TextSpan(
          text: ' Sign In',
          style: const TextStyle(
              color: Color(0xff3461FD), fontWeight: FontWeight.w500),
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
  );
}
