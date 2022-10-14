import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/ThemeViewModel.dart';

class ProgressiveIntervalBar extends StatelessWidget {
  const ProgressiveIntervalBar(
      {Key? key, required this.currentRate, required this.currentSectionNumber})
      : super(key: key);

  // 이번달 현재 요금
  final int currentRate;
  // 구간 번호 (첫번째 구간: 1, 두번째 구간: 2, 세번째 구간: 3)
  final int currentSectionNumber;

  @override
  Widget build(BuildContext context) {
    // Define theme
    var colorTheme = context.theme.colorScheme;

    // 현재는 3구간만 고려
    assert(0 < currentSectionNumber && currentSectionNumber < 4,
        "존재하지 않는 구간 입력 오류");

    var displayWidth = MediaQuery.of(context).size.width;
    var barSize = displayWidth - 60; // 디바이스 넓이 - 양옆 마진

    // 알 수 없는 이유로 circle 위치 오차 수정
    if (currentSectionNumber == 1) {
      barSize -= 60;
    } else if (currentSectionNumber == 2) {
      barSize -= 20;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 누진구간 첫번째 bar
              Expanded(
                  child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    SizedBox(height: 5),
                    Container(
                        height: 5,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: currentSectionNumber == 1
                                ? context.theme.colorScheme.tertiaryContainer
                                : colorTheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(height: 5),
                    Text("0~200 kWh",
                        style: TextStyle(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 12,
                        )),
                  ],
                ),
              )),

              SizedBox(width: 5),

              // 누진구간 두번째 bar
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Container(
                        height: 5,
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: currentSectionNumber == 2
                              ? Color(0xFFFFBF1A)
                              : colorTheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(10),
                        )),
                    SizedBox(height: 5),
                    Text("201~400 kWh",
                        style: TextStyle(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),

              SizedBox(width: 5),

              // 누진구간 세번째 bar
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Container(
                        height: 5,
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: currentSectionNumber == 3
                                ? Color(0xFFFF5D5D)
                                : colorTheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(10))),
                    SizedBox(height: 5),
                    Text("401~ kWh",
                        style: TextStyle(
                          color: colorTheme.onSurface,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
            ],
          ),

          // Circle
          Positioned(
            // 현재 circle 위치 조정
            top: 3,
            left: currentRate / 630 * constraints.maxWidth,
            child: getCurrentPickerCircle(),
          ),
          Positioned(
            top: 3,
            left: 300 / 630 * constraints.maxWidth,
            child: SvgPicture.asset(
              'assets/icons/picker_circle_gray.svg',
            ),
          ),
        ],
      );
    });
  }

  Widget getCurrentPickerCircle() {
    var iconName = "assets/icons/picker_circle";

    if (currentSectionNumber == 1) {
      iconName += "_green";
    } else if (currentSectionNumber == 2) {
      iconName += "_yellow";
    } else {
      iconName += "_red";
    }

    iconName += ".svg";

    return SvgPicture.asset(iconName);
  }

  Widget getCurrentPicker() {
    var iconName = "assets/icons/picker_current";

    // 현재 누진 구간에 따라 색 변경
    if (currentSectionNumber == 1) {
      iconName += "_green";
    } else if (currentSectionNumber == 2) {
      iconName += "_yellow";
    } else {
      iconName += "_red";
    }

    // 테마모드에 따라 배경색 변경
    if (ThemeViewModel.to.isLightTheme.isTrue) {
      iconName += "_light";
    } else {
      iconName += "_dark";
    }

    iconName += ".svg";

    print(iconName);

    return SvgPicture.asset(iconName);
  }

  Widget getPredictPicker() {
    var iconName = "assets/icons/picker_predict";

    // 테마모드에 따라 배경색 변경
    if (ThemeViewModel.to.isLightTheme.isTrue) {
      iconName += "_light";
    } else {
      iconName += "_dark";
    }

    iconName += ".svg";

    return SvgPicture.asset(iconName);
  }
}
