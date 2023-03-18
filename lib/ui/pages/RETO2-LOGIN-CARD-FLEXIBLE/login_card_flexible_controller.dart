import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginCardFlexibleController extends GetxController {
  static LoginCardFlexibleController get to => Get.find<LoginCardFlexibleController>();

  final _controllerPageView = PageController();

  PageController get pageController => _controllerPageView;

  final extendCardFlexible = .3.obs;
  final indexPage = 0.obs;
  final textBotton = 'Siguiente'.obs;
  final extendBotton = 140.obs;
  final isPageCreation = false.obs;

  @override
  void onInit() {
    super.onInit();

    _controllerPageView.addListener(() {
      if (_controllerPageView.offset <= _controllerPageView.position.maxScrollExtent / 2) {
        extendCardFlexible.value = .3;
        textBotton.value = 'Siguiente';
        extendBotton.value = 140;
        isPageCreation.value = false;
      } else {
        extendCardFlexible.value = .4;
        textBotton.value = 'Registarme';
        extendBotton.value = 170;
        isPageCreation.value = true;
      }
    });
  }

  nextPage() {
    if (indexPage.value == 0) {
      _controllerPageView.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOutCubicEmphasized);
    }
  }
}
