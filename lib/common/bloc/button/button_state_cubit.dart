import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/bloc/button/button_state.dart';
import 'package:intelligent_security_systems/core/usecase/usecase.dart';

import '../../../core/error/error.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void execute({required UseCase useCase, dynamic params}) async {
    emit(ButtonLoadingState());
    try {
      Either result = await useCase.call(params);

      result.fold((error) {
        emit(ButtonFailureState(errorMessage: error));
      }, (data) {
        emit(ButtonSuccessState());
      });
    } catch (e) {
      emit(
        ButtonFailureState(
          errorMessage: ApiResponse(message: e.toString(), errors: {
            '': ['']
          }),
        ),
      );
    }
  }
}
