import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/PowerUsageDTO.dart';
import 'package:smart_electric_application/src/domain/model/GraphPointModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/PowerUsageRepositoryInterface.dart';

class GetPowerUsageByHourUsecase {
  final powerUsageRepository = GetIt.I.get<PowerUsageRepositoryInterface>();
  final authRepository = GetIt.I.get<AuthRepositoryInterface>();

  Future<Result<List<GraphPointModel>, String>> excute(
      startDate, endDate) async {
    // 고객번호 가져오기
    Result<String, String> getCustomerNumberResult =
        await authRepository.getCustomerNumber();

    if (getCustomerNumberResult.status == ResultStatus.error) {
      return Result.failure(getCustomerNumberResult.error);
    } else if (getCustomerNumberResult.value == null) {
      return const Result.failure("고객번호 가져오기 실패");
    }

    // 네트워크
    Result<List<PowerUsageDTO>, String> isPowerUsageResult =
        await powerUsageRepository.getPowerUsageByHour(
            customerNumber: getCustomerNumberResult.value!,
            startDate: startDate,
            endDate: endDate);

    // 예외 처리
    if (isPowerUsageResult.status == ResultStatus.error) {
      return Result.failure(isPowerUsageResult.error);
    }

    // Presentation Model로 바꾸기
    List<PowerUsageDTO> powerUsageByDayDTOList = isPowerUsageResult.value!;
    List<GraphPointModel> graphPointModelList = <GraphPointModel>[];

    for (var i = 0; i < powerUsageByDayDTOList.length; i++) {
      graphPointModelList.add(GraphPointModel(
          powerUsageByDayDTOList[i].dateTimeKr,
          powerUsageByDayDTOList[i].powerUsageQuantity));
    }

    return Result.success(graphPointModelList);
  }
}
