import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/RETO1-SLIDERIMAGES/slider_image_controler.dart';

class SliderImagePage extends StatelessWidget {
  const SliderImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _CardTop(),
            _ListImages(),
          ],
        ),
      ),
    );
  }
}

class _ListImages extends StatelessWidget {
  const _ListImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: SliderImageController.to.images.length,
        itemBuilder: (context, i) {
          final image = SliderImageController.to.images[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                SliderImageController.to.urlSelect.value = image;
              },
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                height: 50,
                width: 60,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CardTop extends StatelessWidget {
  const _CardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 400,
      child: Obx(() => Image.network(SliderImageController.to.urlSelect.value, fit: BoxFit.fill)),
    );
  }
}
