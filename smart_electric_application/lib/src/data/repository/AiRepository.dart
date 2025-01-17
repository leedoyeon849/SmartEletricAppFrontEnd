import 'package:dio/dio.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/BillCalculationDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/AiRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getInterceptorDio.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AiRepositoryInterface.dart';

///
class AiRepository implements AiRepositoryInterface {
  /// 한전 고객번호를 이용해 AI 서버에서 지난 요금 납부일부터 다음 요금 납부일까지의 예측 결과 받기
  @override
  Future<Result<AiPredictionDTO, String>> requestAiPrediction(
      {required String customerNumber}) async {
    try {
      final dio = await getInterceptorDio();
      final aiRetrofit = AiRetrofit(dio);

      AiPredictionDTO aiPredictionDTO =
          await aiRetrofit.requestAiPrediction(customerNumber);
      return Result.success(aiPredictionDTO);
      //
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<AiReportDTO, String>> requestAiReport(
      {required String customerNumber}) async {
    try {
      final dio = await getInterceptorDio();
      final aiRetrofit = AiRetrofit(dio);

      AiReportDTO aiReportDTO =
          await aiRetrofit.requestAiReport(customerNumber);

      return Result.success(aiReportDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<BillCalculationDTO, String>> requestCalculateBill(
      {required String customerNumber,
      required double powerUsageQuantity}) async {
    try {
      final dio = await getInterceptorDio();
      final aiRetrofit = AiRetrofit(dio);

      BillCalculationDTO calculateBillDTO = await aiRetrofit.requestCalculateBill(
          customerNumber, powerUsageQuantity);

      return Result.success(calculateBillDTO);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
