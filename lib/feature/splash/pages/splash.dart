import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/bloc/auth/auth_state.dart';
import 'package:intelligent_security_systems/common/bloc/auth/auth_state_cubit.dart';
import 'package:intelligent_security_systems/core/assets/app_images.dart';
import 'package:intelligent_security_systems/feature/auth/presentation/pages/signup.dart';
import 'package:intelligent_security_systems/feature/home/pages/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AuthStateCubit()..appStarted(),
      child: BlocBuilder<AuthStateCubit,AuthState>(
        builder: (context,state){
          if(state is Authenticated){
            return const HomePage();
          }else if(state is UnAuthenticated){
            return const SignupPage();
          }
          return Scaffold(
            body: Center(
              child: Image.asset(
                AppImages.logo,
                width: 300,
                height: 300,
              ),
            ),
          );
        },
      )
    );
  }
}
