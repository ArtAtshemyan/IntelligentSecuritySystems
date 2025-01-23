import 'package:intelligent_security_systems/feature/main/data/models/buildings_res_params.dart';

abstract class BuildingDisplayState {}

class BuildingLoading extends BuildingDisplayState {}

class BuildingLoaded extends BuildingDisplayState {
  final BuildingsResParams buildingsResParams;
  BuildingLoaded({required this.buildingsResParams});
}

class BuildingLoadFailure extends BuildingDisplayState {
  final String errorMessage;
  BuildingLoadFailure({required this.errorMessage});
}
