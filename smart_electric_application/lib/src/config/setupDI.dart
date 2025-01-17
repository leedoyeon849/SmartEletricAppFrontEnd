import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/env/Environment.dart';
import 'package:smart_electric_application/src/data/mock_repository/AiMockRepository.dart';
import 'package:smart_electric_application/src/data/mock_repository/AuthMockRepository.dart';
import 'package:smart_electric_application/src/data/mock_repository/PowerUsageMockRepository.dart';
import 'package:smart_electric_application/src/data/repository/AccountRepository.dart';
import 'package:smart_electric_application/src/data/repository/AiRepository.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';
import 'package:smart_electric_application/src/data/repository/BillRepository.dart';
import 'package:smart_electric_application/src/data/repository/BillSimulationRepository.dart';
import 'package:smart_electric_application/src/data/repository/DefaultRepository.dart';
import 'package:smart_electric_application/src/data/repository/FirebaseRepository.dart';
import 'package:smart_electric_application/src/data/repository/InfoRepository.dart';
import 'package:smart_electric_application/src/data/repository/PowerUsageRepository.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AccountRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/BillRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/BillSimulationRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/DefaultRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/FirebaseRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/InfoRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/PowerUsageRepositoryInterface.dart';

/// Dependency Injection (DI)
void setupDI() {
  // Inject mock in debug environment.
  if(Environment.buildType == BuildType.debugLocal) {
    GetIt.I.registerSingleton<FirebaseRepositoryInterface>(FirebaseRepository());
    GetIt.I.registerSingleton<AuthRepositoryInterface>(AuthMockRepository());
    GetIt.I.registerSingleton<DefaultRepositoryInterface>(DefaultRepository());
    GetIt.I
        .registerSingleton<PowerUsageRepositoryInterface>(PowerUsageMockRepository());
    GetIt.I.registerSingleton<AiRepositoryInterface>(AiMockRepository());
    GetIt.I.registerSingleton<BillSimulationRepositoryInterface>(
        BillSimulationRepository());
    GetIt.I.registerSingleton<AccountRepositoryInterface>(AccountRepository());
    GetIt.I.registerSingleton<InfoRepositoryInterface>(InfoRepository());
    GetIt.I.registerSingleton<BillRepositoryInterface>(BillRepository());
  } else {
    GetIt.I.registerSingleton<FirebaseRepositoryInterface>(FirebaseRepository());
    GetIt.I.registerSingleton<AuthRepositoryInterface>(AuthRepository());
    GetIt.I.registerSingleton<DefaultRepositoryInterface>(DefaultRepository());
    GetIt.I
        .registerSingleton<PowerUsageRepositoryInterface>(PowerUsageRepository());
    GetIt.I.registerSingleton<AiRepositoryInterface>(AiRepository());
    GetIt.I.registerSingleton<BillSimulationRepositoryInterface>(
        BillSimulationRepository());
    GetIt.I.registerSingleton<AccountRepositoryInterface>(AccountRepository());
    GetIt.I.registerSingleton<InfoRepositoryInterface>(InfoRepository());
    GetIt.I.registerSingleton<BillRepositoryInterface>(BillRepository());
  }
}
