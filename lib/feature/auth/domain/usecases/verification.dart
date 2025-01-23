import 'package:dartz/dartz.dart';
import 'package:intelligent_security_systems/core/usecase/usecase.dart';
import 'package:intelligent_security_systems/feature/auth/data/models/verification_req_params.dart';

import '../../../../service_locator.dart';
import '../repository/auth.dart';

class VerificationUseCase implements UseCase<Either,VerificationReqParams> {
  @override
  Future<Either> call(VerificationReqParams param) async {
    return sl<AuthRepository>().verification(param);
  }
}