import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/core/theme/app_colors.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/widgets/basic_text_button.dart';
import '../../../../generated/l10n.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).paymentMethods,
      ),
      backgroundColor: AppColors.whitBac,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _bankCards(context),
          ],
        ),
      ),
    );
  }

  Widget _bankCards(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 16,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.visaCard),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Visa',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10,
                  ),
                ),
                Text(
                  '**** 1234',
                  style: TextStyle(
                    color: Color(0xFF49454F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _showDeleteCardDialog(context);
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicTextButton(
        onPressed: () {
          /// Todo: delete card
        },
        title: S.of(context).delete,
      );
    });
  }

  void _showDeleteCardDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4000000059604645),
      builder: (context) {
        return BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const SignupPage()),
                //       (Route<dynamic> route) => false,
                // );
              }
            },
            child: AlertDialog(
              contentPadding: const EdgeInsets.all(24.0),
              title: Text(
                S.of(context).deleteCard,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Text(
                S.of(context).areYouSureYouWantToDeleteTheDefaultPaymet,
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
                _deleteButton(context)
              ],
            ),
          ),
        );
      },
    );
  }

}
