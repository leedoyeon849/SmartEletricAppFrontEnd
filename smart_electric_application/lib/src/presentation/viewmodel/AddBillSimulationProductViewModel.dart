import 'package:get/get.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/model/ProductTypeData.dart';
import 'package:smart_electric_application/src/domain/usecase/AddSimulationProductUsecase.dart';
import 'package:smart_electric_application/src/domain/usecase/GetSimulationProductsUsecase.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';

class AddBillSimulationProductViewModel extends GetxController {
  static AddBillSimulationProductViewModel get to => Get.find();

  // Input variables
  // 선택된 가전 인덱스(위 productTypes 기준) -> -1은 미선택
  RxString productName = "".obs;
  RxString modelName = "".obs;
  RxInt selectedProductIndex = (-1).obs;
  RxString monthPowerUsage = "".obs;

  // Presentation variables
  RxBool submitButtonEnabled = false.obs;

  // Usecase
  var addSimulationProductUsecase = AddSimulationProductUsecase();
  var getSimulationProductsUsecase = GetSimulationProductsUsecase();

  @override
  void onInit() {
    // TODO: implement onInit

    // 입력시마다 submit button 활성화 가능한지 체크
    ever(productName, (_) => checkRequiredInputs());
    ever(selectedProductIndex, (_) => checkRequiredInputs());
    ever(monthPowerUsage, (_) => checkRequiredInputs());

    super.onInit();
  }

  /// 시뮬레이션 가전 내부 저장소에 저장하기
  void addBillSimulationProduct() async {
    Result<dynamic, String> getSimulationProductsResult =
        await getSimulationProductsUsecase.execute();

    if (getSimulationProductsResult.status == ResultStatus.error) {
      return;
    }

    // 현재 저장된 리스트 맨 마지막 순서로 저장
    int order;
    if (getSimulationProductsResult.value == null) {
      order = 1; // 아무것도 저장 안되어 있으면 1번째
    } else {
      order = getSimulationProductsResult.value.length;
    }

    await addSimulationProductUsecase.execute(BillSimulationProductModel(
        order: order, // 임시 순서
        productName: productName.value,
        modelName: modelName.value,
        productType: ProductTypeData.productTypes[selectedProductIndex.value],
        monthPowerUsage: double.parse(monthPowerUsage.value)));

    // 요금 시뮬레이션 메인 탭 리로드되도록 product 다시 받아오기
    BillSimulationViewModel.to.getBillSimulationProducts();
  }

  /// 필수 항목 전부 입력했는지 확인
  void checkRequiredInputs() {
    if (productName.value.length != 0 &&
        selectedProductIndex.value != -1 &&
        monthPowerUsage.value != 0.0) {
      submitButtonEnabled(true);
    } else {
      submitButtonEnabled(false);
    }
  }
}
