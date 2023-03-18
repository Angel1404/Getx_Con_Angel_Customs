import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/RETO2-LOGIN-CARD-FLEXIBLE/login_card_flexible_controller.dart';

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
                              print('PAGE; $page');
                              controllerCardFlexible.indexPage.value = page;
                            },
                            controller: controllerCardFlexible.pageController,
                            children: const [
                              WelcomePage(),
                              PageCreateAccount(),
                            ],
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.red,
                          radius: 100,
                          hoverColor: Colors.white,
                          onTap: controllerCardFlexible.nextPage,
                          child: AnimatedContainer(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: controllerCardFlexible.extendBotton.value / 3.5,
                            width: controllerCardFlexible.extendBotton.value.toDouble(),
                            margin: const EdgeInsets.only(right: 15, bottom: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                colors: [Colors.purple, Colors.red],
                              ),
                            ),
                            duration: const Duration(milliseconds: 400),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  controllerCardFlexible.textBotton.value,
                                  style: const TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedCrossFade(
                          crossFadeState: CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 400),
                          alignment: Alignment.bottomRight,
                          firstChild: const SizedBox(),
                          secondChild: AnimatedContainer(
                            alignment: controllerCardFlexible.isPageCreation.value ? Alignment.center : null,
                            margin: controllerCardFlexible.isPageCreation.value ? const EdgeInsets.only(bottom: 10) : null,
                            duration: const Duration(milliseconds: 400),
                            height: controllerCardFlexible.isPageCreation.value ? 40 : null,
                            width: controllerCardFlexible.isPageCreation.value ? double.maxFinite : null,
                            child: controllerCardFlexible.isPageCreation.value
                                ? const Text(
                                    'Esta es la pagina de creación de cuentas',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
