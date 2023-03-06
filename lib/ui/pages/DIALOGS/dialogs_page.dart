import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/DIALOGS/utils_dialog.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialogDefauld();
              },
              child: const Text('Defauld Dialog Aquí'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialogBasic();
              },
              child: const Text(' Dialog Aquí'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showSnackBar();
              },
              child: const Text('SnackBar Aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
