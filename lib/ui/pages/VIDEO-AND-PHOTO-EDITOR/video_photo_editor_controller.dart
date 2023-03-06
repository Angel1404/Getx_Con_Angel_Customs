import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPhotoEditController extends GetxController {
  static VideoPhotoEditController get to => Get.find<VideoPhotoEditController>();

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  final pathVideo = File('').obs;

  selectVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video != null) {
      pathVideo.value = File(video.path);
      print(pathVideo.value);
      setVideoController();
    }
  }

  setVideoController() {
    if (pathVideo.value.path.isNotEmpty) {
      videoPlayerController = VideoPlayerController.file(pathVideo.value);
      videoPlayerController.initialize();
      videoPlayerController.play();
      chewieController = ChewieController(videoPlayerController: videoPlayerController);
    }
  }
}
