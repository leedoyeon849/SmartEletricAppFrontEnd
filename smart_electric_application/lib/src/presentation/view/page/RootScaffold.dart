import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/module/common/EmptyAppBar.dart';
import 'package:smart_electric_application/src/presentation/view/module/common/MyBottomNavigationBar.dart';
import 'package:smart_electric_application/src/presentation/view/page/Analysis.dart';
import 'package:smart_electric_application/src/presentation/view/page/Home.dart';
import 'package:smart_electric_application/src/presentation/view/page/Simulation.dart';
import 'package:smart_electric_application/src/presentation/view/page/MyPage.dart';
import 'package:smart_electric_application/src/presentation/view/page/SmartHome.dart';


class RootScaffold extends StatelessWidget{

  // 탭별 화면 정의
  static List<Widget> tabPages = <Widget>[
    Home(),
    const Analysis(),
    const BillSimulation(),
    const SmartHome(),
    const Mypage(),
  ];

  @override
  Widget build(BuildContext context) {

    // 페이지 전환을 위한 MyBottomNavgationBarController 인스턴스화 (의존성 주입)
    // Get.put : 수명이 페이지와 같음
    Get.put(MyBottomNavgationBarController());

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: EmptyAppBar(),
      // MyBottomNavgationBarController의 변수가 변하면 화면 변경
      body: Obx(() => SafeArea(
          child:
              tabPages[MyBottomNavgationBarController.to.selectedIndex.value])),
      bottomNavigationBar: const MyBottomNavgationBar(),
    );
  }
}
