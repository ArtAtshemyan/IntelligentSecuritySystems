import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/feature/face_management/presentation/widgets/static_address.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/widgets/basic_button.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/presentation/widgets/profile_avatar.dart';
import '../widgets/description_text.dart';

class FaceRegistrationPage extends StatefulWidget {
  final File? image;
  final String address;
  const FaceRegistrationPage({
    super.key,
    this.image,
    required this.address,
  });

  @override
  State<FaceRegistrationPage> createState() => _FaceRegistrationPageState();
}

class _FaceRegistrationPageState extends State<FaceRegistrationPage> {
  final TextEditingController _userNameCon = TextEditingController();
  final _faceFormKey = GlobalKey<FormState>();
  String? _userNameErrorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).back,
      ),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            // if (state is ButtonSuccessState) {
            //   Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const HomeNavigationPage()),
            //     (Route<dynamic> route) => false,
            //   );
            // } else if (state is ButtonFailureState) {
            //   final emailError =
            //       state.errorMessage.getErrorForField(ErrorField.email);
            //   if (emailError != null) {
            //     setState(() {
            //       _mailErrorText = emailError;
            //     });
            //   } else {
            //     var snackBar = SnackBar(
            //       content: Text(state.errorMessage.message ??
            //           S.of(context).unknownException),
            //       backgroundColor: AppColors.red,
            //     );
            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //   }
            // }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileAvatar(image: widget.image),
                  const SizedBox(height: 24.0),
                  StaticAddress(
                    title: S.of(context).assignAddress,
                    address: widget.address,
                  ),
                  const SizedBox(height: 32.0),
                  DescriptionText(text: S.of(context).userName),
                  const SizedBox(height: 16.0),
                  Form(
                    key: _faceFormKey,
                    onChanged: () {
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        _userNameField(),
                        const SizedBox(height: 32.0),
                        _assignButton(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _userNameField() {
    return TextFormField(
      onTap: () {
        if (_userNameErrorText != null) {
          setState(() {
            _userNameErrorText = null;
          });
        }
      },
      controller: _userNameCon,
      decoration: InputDecoration(
        errorText: _userNameErrorText,
        suffixIcon: _userNameCon.text.isNotEmpty
            ? _userNameErrorText == null
                ? IconButton(
                    onPressed: () {
                      clearController(_userNameCon);
                    },
                    icon: SvgPicture.asset(AppVectors.close),
                  )
                : const Icon(
                    Icons.error_outline_outlined,
                    color: AppColors.red,
                  )
            : null,
        hintText: S.of(context).userName,
        labelText: S.of(context).userName,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).pleaseEnterYourName;
        }
        return null;
      },
    );
  }

  Widget _assignButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: S.of(context).assign,
          onPressed: _userNameCon.text.isNotEmpty
              ? () {
                  if (_faceFormKey.currentState?.validate() ?? false) {
                    // context.read<ButtonStateCubit>().execute();
                  }
                }
              : null,
        );
      },
    );
  }

  void clearController(TextEditingController controller) {
    controller.text = '';
    setState(() {});
  }
}
