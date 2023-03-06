import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/APP-LIBROS-U/app_libros_controller.dart';
import 'package:get_con_angel01/ui/pages/RETO1-SLIDERIMAGES/slider_image_controler.dart';
import 'package:get_con_angel01/ui/pages/VIDEO-AND-PHOTO-EDITOR/video_photo_editor_controller.dart';

class SliderImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliderImageController>(() => SliderImageController());
  }
}

class VideoPhotoEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoPhotoEditController>(() => VideoPhotoEditController());
  }
}

/// APP PARA LIBROS DE LA UNIVERSIDAD

class AppLibrosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLibrosController>(() => AppLibrosController(), fenix: true);
  }
}
