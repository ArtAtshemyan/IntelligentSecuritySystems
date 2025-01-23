import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/bloc/button/button_state.dart';
import 'package:intelligent_security_systems/common/bloc/button/button_state_cubit.dart';

import '../../core/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;

  const BasicAppButton(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<ButtonStateCubit,ButtonState>(
          builder: (context,state){
            if(state is ButtonLoadingState){
              return _loading(context);
            }
            return _initial(context);
          }
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50.0),
      ),
      onPressed: null,
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            )
          : const CupertinoActivityIndicator(
              radius: 15.0, color: CupertinoColors.activeBlue),
    );
  }

  Widget _initial(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50.0),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.lightBackground,
        ),
      ),
    );
  }
}
