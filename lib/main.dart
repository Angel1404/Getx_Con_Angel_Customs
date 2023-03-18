import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init(); // Se inicializa el storage local
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGINCARDFLEXIBLEPAGE,
      // theme: appThemeData,
      defaultTransition: Transition.fadeIn,
      // initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    ),
  );
}
