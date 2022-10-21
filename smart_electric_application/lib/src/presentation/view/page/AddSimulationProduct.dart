import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomTextInput.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/RoundedButton.dart';
import 'package:smart_electric_application/src/presentation/view/module/simulation/SelectProductTypeModal.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/AddSimulationProductViewModel.dart';

class AddSimulationProduct extends StatelessWidget {
  const AddSimulationProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ViewModel DI
    Get.put(AddSimulationProductViewModel());

    // Theme
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.theme.textTheme;

    return Scaffold(
        appBar: AppBar(
          title: const Text('가전 추가하기'),
          foregroundColor: colorTheme.onBackground,
          shadowColor: Colors.transparent,
          backgroundColor: colorTheme.background,
        ),
        body: SingleChildScrollView(
          child: Obx(() => Container(
              decoration: BoxDecoration(
                color: context.theme.colorScheme.background,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title text
                  SizedBox(height: 30),
                  Text("시뮬레이션을 위한", style: textTheme.headline1),
                  SizedBox(height: 7),
                  Text("가전목록을 추가해주세요", style: textTheme.headline1),

                  // Input - 제품명
                  SizedBox(height: 30),
                  CustomTextInput(
                      labelText: "제품명",
                      placeholder: "제품명을 입력해 주세요.",
                      textInputStyle: TextInputStyle.bordered,
                      focusColor: colorTheme.secondaryContainer,
                      onChanged: (value) {
                        print(value);
                      }),

                  // Input - 모델명
                  SizedBox(height: 30),
                  CustomTextInput(
                      labelText: "모델명",
                      placeholder: "제품 모델명을 입력해 주세요.(선택)",
                      textInputStyle: TextInputStyle.bordered,
                      focusColor: colorTheme.secondaryContainer,
                      onChanged: (value) {
                        print(value);
                      }),

                  // Input - 종류
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "종류",
                      style: TextStyle(
                          fontSize: 14,
                          color: colorTheme.onSurface,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      // Get.to(SelectProdauctType(),
                      //     transition: Transition.cupertinoDialog);
                      showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return SelectProductTypeModal();
                          });
                    },
                    child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: colorTheme.outline,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (AddSimulationProductViewModel
                                    .to.selectedProductIndex.value ==
                                -1) ...[
                              Text("가전 종류를 선택해주세요.",
                                  style: TextStyle(
                                      color: colorTheme.surfaceVariant,
                                      fontSize: 16)),
                            ] else ...[
                              Text("냔냐",
                                  style: TextStyle(
                                      color: colorTheme.surfaceVariant,
                                      fontSize: 16))
                            ],
                            SvgPicture.asset(
                              'assets/icons/arrow_right.svg',
                              color: colorTheme.onSurface,
                            ),
                          ],
                        )),
                  ),

                  // Input - 월간 소비 전력량
                  SizedBox(height: 30),
                  CustomTextInput(
                      labelText: "월간 소비 전력량",
                      placeholder: "월간 소비 전력량을 입력해주세요.",
                      textInputStyle: TextInputStyle.bordered,
                      focusColor: colorTheme.secondaryContainer,
                      suffixText: "kWh",
                      onChanged: (value) {
                        print(value);
                      }),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/noti.svg'),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text("가전제품의 에너지소비효율등급표에서 확인하실 수 있습니다.",
                            style: TextStyle(
                                color: colorTheme.onSurface,
                                fontSize: 12,
                                height: 1.2)),
                      ),
                    ],
                  ),

                  // Information image
                  SizedBox(height: 15),
                  Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: colorTheme.outline,
                        ),
                      ),
                      child: Image.asset(
                          'assets/images/power_consumption_information.png')),

                  // Submit button
                  SizedBox(height: 30),
                  RoundedButton(
                      text: "추가하기",
                      bgColor: colorTheme.secondaryContainer,
                      textColor: colorTheme.onPrimary,
                      size: ButtonSize.large,
                      action: () {}),
                  SizedBox(height: 60),
                ],
              )),
        )));
  }
}
