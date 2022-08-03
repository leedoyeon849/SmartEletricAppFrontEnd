import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NowChargeBanner extends StatelessWidget {
  const NowChargeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 데이터
    var dataValue = "13,030";
    var bodyValue = "/ 125 kWh";


    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        margin: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "소마님의 현재 요금",
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "${dataValue}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  "원 ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                Text(
                  "${bodyValue}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              " 지난달 대비 12% ▼",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: context.theme.colorScheme.secondary,
              ),
            ),
          ],
        ));
  }
}