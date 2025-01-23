import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intelligent_security_systems/core/error/error.dart';
import 'package:intelligent_security_systems/core/network/dio_client.dart';

import '../../../../core/constants/app_urls.dart';
import '../../../../service_locator.dart';
import '../models/signin_req_params.dart';
import '../models/signup_req_params.dart';
import '../models/verification_req_params.dart';

abstract class AuthApiService{
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> verification(VerificationReqParams verificationReqParams);
  Future<Either> signIn(SignInReqParams signInReq);
  Future logOut();
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    try{
      var response = await sl<DioClient>().post(AppUrls.signupEndpoint,data: signupReq.toMap());
      return Right(response);
    }on DioException catch(e) {
      ApiResponse errorResponse = ApiResponse.fromJson(e.response!.data);
      return Left(errorResponse);
    }
  }

  @override
  Future<Either> verification(VerificationReqParams verificationReqParams) async {
    try{
      var response = await sl<DioClient>().post(AppUrls.verificationEndpoint,data: verificationReqParams.toMap());
      return Right(response);
    }on DioException catch(e) {
      ApiResponse errorResponse = ApiResponse.fromJson(e.response!.data);
      return Left(errorResponse);
    }
  }

  @override
  Future<Either> signIn(SignInReqParams signInReq) async {
    try{
      var response = await sl<DioClient>().post(AppUrls.signInEndpoint,data: signInReq.toMap());
      return Right(response);
    }on DioException catch(e) {
      ApiResponse errorResponse = ApiResponse.fromJson(e.response!.data);
      return Left(errorResponse);
    }
  }

  @override
  Future logOut() async {
    try{
      var response = await sl<DioClient>().post(AppUrls.logOutEndpoint);
      return Right(response);
    }on DioException catch(e) {
      ApiResponse errorResponse = ApiResponse.fromJson(e.response!.data);
      return Left(errorResponse);
    }
  }

}