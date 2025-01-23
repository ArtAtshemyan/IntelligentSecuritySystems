import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intelligent_security_systems/feature/main/data/models/buildings_res_params.dart';
import 'package:intelligent_security_systems/feature/main/data/sources/building_api_serivce.dart';
import 'package:intelligent_security_systems/feature/main/domain/repositories/building.dart';

import '../../../../service_locator.dart';

class BuildingRepositoryImp extends BuildingRepository {
  @override
  Future<Either> getBuildings() async {
    Either result = await sl<BuildingApiService>().getBuildings();
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      var buildings = BuildingsResParams.fromJson(response.data['data']);
      return Right(buildings);
    });
  }
}
