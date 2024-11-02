import 'package:intelligent_security_systems/core/error/error.dart';

abstract class ButtonState{}

class ButtonInitialState extends ButtonState{}

class ButtonLoadingState extends ButtonState{}

class ButtonSuccessState extends ButtonState{}

class ButtonFailureState extends ButtonState{
  final ApiResponse errorMessage;
  ButtonFailureState({required this.errorMessage});
}
