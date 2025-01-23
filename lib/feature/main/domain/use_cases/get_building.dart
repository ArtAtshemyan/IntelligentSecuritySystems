import 'package:dartz/dartz.dart';
import 'package:intelligent_security_systems/core/usecase/usecase.dart';
import 'package:intelligent_security_systems/feature/main/domain/repositories/building.dart';

import '../../../../service_locator.dart';

class GetBuildingUseCase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call(dynamic param) {
    return sl<BuildingRepository>().getBuildings();
  }
  
}