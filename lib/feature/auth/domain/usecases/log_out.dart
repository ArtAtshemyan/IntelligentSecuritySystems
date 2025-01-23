import 'package:intelligent_security_systems/feature/auth/domain/repository/auth.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../service_locator.dart';

class LogOutInUseCase implements UseCase<dynamic,dynamic> {
  @override
  Future call(param) {
    return sl<AuthRepository>().logOut();
  }


}