

import 'package:intelligent_security_systems/feature/auth/data/source/auth_local_service.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool,dynamic> {
  @override
  Future<bool> call(dynamic param) async {
    return sl<AuthLocalService>().isLoggedIn();
  }

}