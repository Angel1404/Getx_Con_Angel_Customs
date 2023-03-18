import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/RETO2-LOGIN-CARD-FLEXIBLE/login_card_flexible_controller.dart';

import 'Widgets/botton_flexible_login.dart';
import 'Widgets/botton_text_create_acount.dart';
import 'Widgets/create_acount_login.dart';
import 'Widgets/welcome_page_login.dart';

class LoginCardFlexiblePage extends StatelessWidget {
  LoginCardFlexiblePage({super.key});
  final controllerCardFlexible = LoginCardFlexibleController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => AnimatedContainer(
                  height: Get.height * controllerCardFlexible.extendCardFlexible.value,
                  // height: Get.height * .3,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: PageView(
                          onPageChanged: (page) {
                            controllerCardFlexible.indexPage.value = page;
                          },
                          controller: controllerCardFlexible.pageController,
                          children: const [
                            WelcomePage(),
                            PageCreateAccount(),
                          ],
                        ),
                      ),
                      BottonLoginFlexible(controllerCardFlexible: controllerCardFlexible),
                      BottonTextCreateAcount(controllerCardFlexible: controllerCardFlexible),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
