import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/feature/main/domain/use_cases/get_building.dart';
import 'package:intelligent_security_systems/feature/main/presentation/bloc/building_display_state.dart';

import '../../../../service_locator.dart';

class BuildingDisplayCubit extends Cubit<BuildingDisplayState>{
  BuildingDisplayCubit():super(BuildingLoading());

  void getBuildingInformation() async {
    emit(BuildingLoading());
    var result = await sl<GetBuildingUseCase>().call('');
    return result.fold((error) {
      emit(BuildingLoadFailure(errorMessage: error));
    }, (data) {
     emit(BuildingLoaded(buildingsResParams: data));
    });
  }

}