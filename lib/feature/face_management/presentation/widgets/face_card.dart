import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_security_systems/common/widgets/basic_text_button.dart';
import 'package:intelligent_security_systems/core/assets/app_vectors.dart';
import 'package:intelligent_security_systems/feature/face_management/presentation/widgets/layout_card.dart';
import 'package:intelligent_security_systems/feature/smart_intercom/data/data_sources/deleted/stor.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class FaceCard extends StatelessWidget {
  final UserInfo userInfo;

  const FaceCard({
    super.key,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutCard(
      width: 185,
      height: 327,
      widget: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 235,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      userInfo.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userInfo.fio,
                      style: const TextStyle(
                        color: AppColors.darkBackground,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.50,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        Text(
                          userInfo.address.substring(0, 12),
                          style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 11.0),
              child: GestureDetector(
                onTap: () {
                  _showDeleteDialog(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.3199999928474426),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: SvgPicture.asset(AppVectors.delete),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicTextButton(
        onPressed: () {
          /// Todo: delete face
        },
        title: S.of(context).delete,
      );
    });
  }

  void _showDeleteDialog(BuildContext context) {
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
                S.of(context).deleteFace,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Text(
                S.of(context).writeShortDescriptionHere,
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
