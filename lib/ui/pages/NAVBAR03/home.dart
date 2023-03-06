import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/pages/NAVBAR03/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Obx(
      () => Scaffold(
        body: controller.selectBody(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.shifting,
          currentIndex: controller.cuurentIndex.value,
          onTap: (value) {
            controller.cuurentIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Center(
        child: Text('Estamos en la pagina inicial'),
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Center(
        child: Text('Estamos en la pagina de perfil'),
      ),
    );
  }
}

class Home3 extends StatelessWidget {
  const Home3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Center(
        child: Text('Estamos en la pagina de config'),
      ),
    );
  }
}
