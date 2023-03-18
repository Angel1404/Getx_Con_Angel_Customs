import 'package:get/get.dart';
import 'package:get_con_angel01/bindings/bindings.dart';

import '../ui/z_routes_ui.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.VARIABLESPAGE,
      page: () => const VariablesPage(),
    ),
    GetPage(
      name: Routes.DIALOGSPAGE,
      page: () => const DialogsPage(),
    ),
    GetPage(
      name: Routes.SLIDERIMAGEPAGE,
      page: () => const SliderImagePage(),
      binding: SliderImageBinding(),
    ),
    GetPage(
      name: Routes.VIDEOPHOTOEDITOR,
      page: () => VideoPhotoEditorScreen(),
      binding: VideoPhotoEditBinding(),
    ),

    /**
     * App de lirbros
     */
    GetPage(
      name: Routes.APPLIBROSSREEN,
      page: () => const AppLibrosScreen(),
      binding: AppLibrosBinding(),
    ),
    GetPage(
      name: Routes.CREARLIBROSPAGE,
      page: () => const CreateLibrosPage(),
      binding: AppLibrosBinding(),
    ),
    GetPage(
      name: Routes.VERLIBROSPAGE,
      page: () => VerLibrosPage(),
      binding: AppLibrosBinding(),
    ),
    GetPage(
      name: Routes.DETALLELIBROPAGE,
      page: () => DetalleLibroPage(),
    ),

    //
    GetPage(
      name: Routes.LOGINCARDFLEXIBLEPAGE,
      page: () => LoginCardFlexiblePage(),
      binding: LoginCardFlexibleBinding(),
    ),
  ];
}
