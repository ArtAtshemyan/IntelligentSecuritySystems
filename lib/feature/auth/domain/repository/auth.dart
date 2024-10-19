import 'package:dartz/dartz.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/signup_req_params.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/verification_req_params.dart';

import '../../data/models/signin_req_params.dart';

abstract class AuthRepository{
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> signIn(SignInReqParams signInReq);
  Future<bool> isLoggedIn();
  Future<Either> verification(VerificationReqParams verificationReqParams);
}