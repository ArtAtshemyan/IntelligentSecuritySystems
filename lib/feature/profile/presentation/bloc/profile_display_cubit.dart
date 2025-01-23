import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/log_out.dart';
import 'package:intelligent_security_systems/feature/profile/presentation/bloc/profile_display_state.dart';

import '../../../../service_locator.dart';

class ProfileDisplayCubit extends Cubit<ProfileDisplayState>{
  ProfileDisplayCubit():super(ProfileLoading());

  void logOuting() async {
    emit(ProfileLoading());
    var result = await sl<LogOutInUseCase>().call('');
    result.fold((error) {
      emit(ProfileLoadFailure(errorMessage: error));
    }, (data) {
     emit(ProfileLoaded());
    });
  }

}