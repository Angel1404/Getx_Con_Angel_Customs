import 'package:flutter/material.dart';
import 'package:get/get.dart';

showDialogDefauld() {
  Get.defaultDialog(
    title: 'Hola Flutteros',
    middleText: 'Este es un defauld dialog',
    content: Column(
      children: [
        const Text('kksjkdjskdjskdjskdjskd'),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Presiona aqui'))
      ],
    ),
  );
}

showDialogBasic() {
  Get.dialog(
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
      ],
    ),
  );
}

showSnackBar() {
  Get.snackbar(
    'Hola Flutteros',
    'Estamos mostrando un snackBar sin contexto',
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.GROUNDED,
  );
}
