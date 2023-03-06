import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/VIDEO-AND-PHOTO-EDITOR/video_photo_editor_controller.dart';

class VideoPhotoEditorScreen extends StatelessWidget {
  VideoPhotoEditorScreen({super.key});
  final controller = VideoPhotoEditController.to;
  @override
  Widget build(BuildContext context) {
    // print('init;: ${controller.videoPlayerController.value.isInitialized}');

    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Obx(
              () => Container(
                margin: const EdgeInsets.all(20),
                child: (controller.pathVideo.value.path.isEmpty) ? const SizedBox() : Chewie(controller: controller.chewieController),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: controller.selectVideo,
                child: const Text('Select Video'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
