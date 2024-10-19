import 'package:dartz/dartz.dart';
import 'package:intelligent_security_systems/core/usecase/usecase.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/signup_req_params.dart';
import 'package:intelligent_security_systems/feature/auth/data/repository/auth.dart';

import '../../../../service_locator.dart';

class SignupUseCase implements UseCase<Either,SignupReqParams> {
  @override
  Future<Either> call(SignupReqParams param) async {
    return sl<AuthRepositoryImp>().signup(param);
  }

}