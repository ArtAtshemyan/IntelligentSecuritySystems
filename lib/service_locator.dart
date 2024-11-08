import 'package:get_it/get_it.dart';
import 'package:intelligent_security_systems/feature/auth/data/repository/auth.dart';
import 'package:intelligent_security_systems/feature/auth/data/source/auth_api_service.dart';
import 'package:intelligent_security_systems/feature/auth/data/source/auth_local_service.dart';
import 'package:intelligent_security_systems/feature/auth/domain/repository/auth.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/log_out.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/signup.dart';
import 'package:intelligent_security_systems/feature/auth/domain/usecases/verification.dart';
import 'package:intelligent_security_systems/feature/main/data/repositories/building.dart';
import 'package:intelligent_security_systems/feature/main/data/sources/building_api_serivce.dart';
import 'package:intelligent_security_systems/feature/main/domain/repositories/building.dart';

import 'core/network/dio_client.dart';
import 'feature/auth/domain/usecases/is_logged_in.dart';
import 'feature/auth/domain/usecases/sign_in.dart';
import 'feature/main/domain/use_cases/get_building.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  /// Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  sl.registerSingleton<BuildingApiService>(BuildingApiServiceImpl());

  /// Repository
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImp(),
  );
  sl.registerSingleton<BuildingRepository>(
    BuildingRepositoryImp(),
  );

  /// UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<VerificationUseCase>(VerificationUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetBuildingUseCase>(GetBuildingUseCase());
  sl.registerSingleton<LogOutInUseCase>(LogOutInUseCase());
}
