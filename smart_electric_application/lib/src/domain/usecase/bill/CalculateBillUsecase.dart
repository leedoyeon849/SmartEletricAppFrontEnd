import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/power_usage/GetPowerUsageOfSpecificMonthUsecase.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AiRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';

/// 전력 사용량(kWh)로 요금(원) 계산
class CalculateBillUsecase {
  // final powerUsageRepository = GetIt.I.get<PowerUsageRepositoryInterface>();
  final aiRepository = GetIt.I.get<AiRepositoryInterface>();
  final authRepository =
      GetIt.I.get<AuthRepositoryInterface>();

  // Usecase
  final getPowerUsageOfThisMonthUsecase = GetPowerUsageOfSpecificMonthUsecase();

  Future<Result<BillCalculationDTO, String>> execute(
      double powerUsageQuantity) async {
    // 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    } else if (getCustomerNumberResult.value == null) {
      return const Result.failure("Failed to get customer number");
    }

    // 이번달 예상 요금 계산하기
    Result<BillCalculationDTO, String> requestCalculateBillResult =
        await aiRepository.requestCalculateBill(
            customerNumber: getCustomerNumberResult.value!,
            powerUsageQuantity: powerUsageQuantity);

    if (requestCalculateBillResult.status == ResultStatus.error) {
      return Result.failure(requestCalculateBillResult.error);
    }

    return Result.success(requestCalculateBillResult.value!);
  }
}
