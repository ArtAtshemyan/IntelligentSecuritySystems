import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/app_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator.dart';

abstract class BuildingApiService {
  Future<Either> getBuildings();
}

class BuildingApiServiceImpl extends  BuildingApiService {
  @override
  Future<Either> getBuildings() async {
    try{
      /// ToDo: worker TokenInterceptor or no
      // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      // var token = sharedPreferences.getString(SharedPreferencesKeys.accessToken);
      var response = await sl<DioClient>().get(AppUrls.buildingsEndpoint,
      //     options: Options(
      //   headers: {'Authorization' : 'Bearer $token'}
      // ),
      );
      return Right(response);
    }on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}