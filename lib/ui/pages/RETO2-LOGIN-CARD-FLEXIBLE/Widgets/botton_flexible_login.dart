import 'package:flutter/material.dart';

import '../login_card_flexible_controller.dart';

class BottonLoginFlexible extends StatelessWidget {
  const BottonLoginFlexible({
    Key? key,
    required this.controllerCardFlexible,
  }) : super(key: key);

  final LoginCardFlexibleController controllerCardFlexible;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
