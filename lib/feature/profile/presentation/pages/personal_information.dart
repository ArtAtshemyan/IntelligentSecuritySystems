import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/feature/profile/presentation/widgets/profile_avatar.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/widgets/basic_button.dart';
import '../../../../core/assets/app_vectors.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final TextEditingController _userNameCon = TextEditingController();
  final _userNameFormKey = GlobalKey<FormState>();
  String? _userNameErrorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).personalInformation,
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const ProfileAvatar(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      S.of(context).changeImage,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  Form(
                    key: _userNameFormKey,
                    onChanged: () {
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        _userNameField(),
                        const SizedBox(height: 32.0),
                        _saveButton(context),
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

  Widget _saveButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: S.of(context).save,
          onPressed: _userNameCon.text.isNotEmpty
              ? () {
                  if (_userNameFormKey.currentState?.validate() ?? false) {
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
