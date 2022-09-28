import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:smart_electric_application/src/domain/entity/GraphPointModel.dart';

class BarGraphViewModel extends GetxController {
  // static BarGraphViewModel get to => Get.find();

  Rx<ScrollController> scrollController = ScrollController().obs;

  RxDouble maxBarHeight = 60.0.obs;
  RxDouble barWidth = 7.0.obs;
  RxDouble barGap = 10.0.obs;

  // Graph mock data
  List<GraphPointModel> mockData = <GraphPointModel>[];

  @override
  void onInit() {
    // Create mock data
    for (int i = 0; i < 100; i += 5) {
      var yValue = i.toDouble();
      // yValue = double.parse(yValue.toStringAsFixed(1));
      mockData.add(GraphPointModel("$i일", yValue));
      print("mockData");
    }

    scrollController.value.addListener(() {
      print("### scroll value ${scrollController.value.offset}");
      print("### first bar pos: ${scrollController.value.offset ~/ 27}");
      setMaxBarHeight();
    });

    super.onInit();
  }

  void setMaxBarHeight() {
    // 첫번째 Bar 위치
    var firstBarOnScreen = scrollController.value.offset ~/ 27;
    // 화면에 한번에 들어온 바 개수
    var barNumberOnScreenTemp = 10; // #### 계산필요
    // 화면에 들어온 바 데이터 자르기
    var start = firstBarOnScreen;
    var end = firstBarOnScreen + barNumberOnScreenTemp;
    if (start < 0) start = 0;
    if (end > mockData.length) end = mockData.length;
    var subList = mockData.sublist(start, end);
    // 최댓값 구하기
    var maxBarHeightPrimitive = [...subList].reduce(
        (value, element) => value.yValue > element.yValue ? value : element);
    // y축 조정 (20은 라벨 감안한 여분 값)
    maxBarHeight(maxBarHeightPrimitive.yValue + 20);
    print(maxBarHeightPrimitive);
  }
}

class BarGraph extends GetView<BarGraphViewModel> {
  const BarGraph(
      {Key? key,
      this.graphHeight = 300,
      this.yAxisNumber = 6,
      this.xAxisWidth = 20})
      : super(key: key);

  // Custom variable define
  final double graphHeight; // 전체 그래프 높이
  final double yAxisNumber;
  final double xAxisWidth; // x축 넓이

  @override
  Widget build(BuildContext context) {
    // Viewmodel dependency injection
    Get.put(BarGraphViewModel());

    // theme style define
    var textTheme = context.theme.textTheme;
    var colorTheme = context.theme.colorScheme;

    // Setting variables
    double yAxisHeight = graphHeight / yAxisNumber - 10; // y축 하나 높이

    // Viewmodel initialize
    var deviceWidth = MediaQuery.of(context).size.width;
    var contentWidth = deviceWidth - 60; // 패딩값 뺀거
    var barUnitWidth =
        controller.barWidth.value + (controller.barGap.value * 2);
    var barNumberPerScreen =
        (contentWidth / barUnitWidth).toInt(); //화면 당 bar 개수
    print("화면 당 바 개수 ${barNumberPerScreen}");

    return Obx(() => SizedBox(
          height: graphHeight,
          child: Stack(children: [
            // layer 1 : y axis
            Container(
              child: Column(children: [
                for (int i = controller.maxBarHeight.value.toInt();
                    i > 0;
                    i -= (controller.maxBarHeight.value ~/ 6)) ...[
                  Row(
                    children: [
                      Text(
                        "${i}",
                        style: TextStyle(
                            fontSize: 13, color: colorTheme.surfaceVariant),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.outline,
                        ),
                      )),
                      SizedBox(height: yAxisHeight),
                    ],
                  ),
                ],
              ]),
            ),
            // layer 2 : x axis
            OverflowBox(
                alignment: Alignment.bottomCenter,
                maxHeight: graphHeight + 500, //500은 overflow 임의값
                child: ListView(
                  controller: controller.scrollController.value,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var data in controller.mockData) ...[
                      GestureDetector(
                        onTap: () {
                          print(data.xValue);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: controller.barGap.value),
                          decoration: BoxDecoration(
                              // color: context.theme.colorScheme.secondary,
                              ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedContainer(
                                  // margin: EdgeInsets.only(top: data),
                                  height: (300 /
                                      controller.maxBarHeight.value *
                                      data.yValue),
                                  width: controller.barWidth.value,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // X Axis value
                                Text(
                                  "${data.xValue}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: colorTheme.onSurface),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ))
          ]),
        ));
  }
}
