import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intelligent_security_systems/core/constants/shared_perfereces_keys.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/signin_req_params.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/verification_req_params.dart';
import 'package:intelligent_security_systems/feature/auth/data/source/auth_api_service.dart';
import 'package:intelligent_security_systems/feature/auth/data/source/auth_local_service.dart';
import 'package:intelligent_security_systems/feature/auth/domain/repository/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../service_locator.dart';
import '../models/signup_req_params.dart';

class AuthRepositoryImp extends AuthRepository {

  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    Either result = await sl<AuthApiService>().signup(signupReq);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
            SharedPreferencesKeys.accessToken, response.data['data']['token']);
        return Right(response);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> verification(
      VerificationReqParams verificationReqParams) async {
    Either result =
        await sl<AuthApiService>().verification(verificationReqParams);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        return Right(response);
      },
    );
  }

  @override
  Future<Either> signIn(SignInReqParams signInReq) async {
    Either result = await sl<AuthApiService>().signIn(signInReq);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        sharedPreferences.setString(
            SharedPreferencesKeys.accessToken, response.data['data']['token']);
        return Right(response);
      },
    );
  }
}
