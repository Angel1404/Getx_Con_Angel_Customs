import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../z_routes_ui.dart';

class HomeController extends GetxController {
  final cuurentIndex = 0.obs;

  Widget selectBody() {
    final mapWidgetHome = {
      0: const Home1(),
      1: const Home2(),
      2: const Home3(),
    };

    return mapWidgetHome[cuurentIndex.value] ?? const Home1();
  }
}
