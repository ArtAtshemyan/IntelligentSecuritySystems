import 'package:dartz/dartz.dart';
import 'package:intelligent_security_systems/core/usecase/usecase.dart';

import '../../../../service_locator.dart';
import '../../data/models/signin_req_params.dart';
import '../repository/auth.dart';

class SignInUseCase implements UseCase<Either,SignInReqParams> {
  @override
  Future<Either> call(SignInReqParams param) async {
    return sl<AuthRepository>().signIn(param);
  }

}