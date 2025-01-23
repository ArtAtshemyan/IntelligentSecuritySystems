import 'package:dartz/dartz.dart';
import 'package:intelligent_security_systems/core/usecase/usecase.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/signup_req_params.dart';

import '../../../../service_locator.dart';
import '../repository/auth.dart';

class SignupUseCase implements UseCase<Either,SignupReqParams> {
  @override
  Future<Either> call(SignupReqParams param) async {
    return sl<AuthRepository>().signup(param);
  }

}