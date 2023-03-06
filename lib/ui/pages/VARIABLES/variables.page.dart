import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/VARIABLES/variables_page_controller.dart';

class VariablesPage extends StatelessWidget {
  const VariablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariableController());
    return Scaffold(
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.user.value.name),
                Text(controller.user.value.age.toString()),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.changePerson2();
        },
      ),
    );
  }
}
