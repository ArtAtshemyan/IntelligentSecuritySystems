import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/bloc/auth/auth_state_cubit.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/is_logged_in.dart';

import '../../../service_locator.dart';

class AuthStateCubit extends Cubit<AuthState>{
  AuthStateCubit() : super(AppInitialState());

  void appStarted() async {
    var isLoggedIn = await sl<IsLoggedInUseCase>().call('');
    if(isLoggedIn){
      emit(Authenticated());
    }else {
      emit(UnAuthenticated());
    }
  }
}