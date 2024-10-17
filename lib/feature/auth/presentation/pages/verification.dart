import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/widgets/basic_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class VerificationPage extends StatefulWidget {
  final String phoneNumber;
  const VerificationPage({super.key, required this.phoneNumber});

  @override
  State<VerificationPage> createState() => _VerificationState();
}

class _VerificationState extends State<VerificationPage> {
  final TextEditingController _confirmCodeCon = TextEditingController();
  final _confirmFormKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _confirmFormKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: _verification(),
                  ),
                  const SizedBox(height: 16),
                  _desc(),
                  const SizedBox(height: 24),
                  _confirmCodeField(),
                  const SizedBox(height: 16),
                  _confirmButton(context, _confirmFormKey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _verification() {
    return Text(
      S.of(context).verification,
      textAlign: TextAlign.start,
      style: TextStyle(
          color:
              context.isDarkMode ? AppColors.lightBackground : AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 24),
    );
  }

  Widget _desc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).SentDigitCode,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: context.isDarkMode
                ? AppColors.lightBackground
                : AppColors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Text(
          widget.phoneNumber,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: context.isDarkMode
                ? AppColors.lightBackground
                : AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _confirmCodeField() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PinCodeTextField(
            appContext: context,
            pastedTextStyle: TextStyle(
                color: context.isDarkMode
                    ? AppColors.lightGrey
                    : AppColors.darkGrey,
                fontWeight: FontWeight.w400,
                fontSize: 16),
            length: 6,
            pinTheme: PinTheme(
              inactiveFillColor: context.isDarkMode
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
              selectedFillColor: context.isDarkMode
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
              shape: PinCodeFieldShape.box,
              inactiveColor: AppColors.primary,
              borderRadius: BorderRadius.circular(4),
              fieldHeight: 56,
              fieldWidth: 40,
              activeFillColor: context.isDarkMode
                  ? AppColors.lightBackground
                  : AppColors.darkBackground,
            ),
            cursorColor: Colors.black,
            errorAnimationController: errorController,
            controller: _confirmCodeCon,
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              debugPrint("Completed");
            },
            onChanged: (value) {
              setState(() {
                currentText = value;
              });
            },
          ),
        ));
  }

  Widget _confirmButton(BuildContext context, GlobalKey<FormState> formKey) {
    return BasicAppButton(
      title: S.of(context).next,
      onPressed: _confirmCodeCon.text.isNotEmpty
          ? () {
              if (formKey.currentState?.validate() ?? false) {
                ///Todo: send response
              }
            }
          : null,
    );
  }
}
