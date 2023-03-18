import 'package:flutter/material.dart';

import '../login_card_flexible_controller.dart';

class BottonTextCreateAcount extends StatelessWidget {
  const BottonTextCreateAcount({
    Key? key,
    required this.controllerCardFlexible,
  }) : super(key: key);

  final LoginCardFlexibleController controllerCardFlexible;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
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
    );
  }
}
