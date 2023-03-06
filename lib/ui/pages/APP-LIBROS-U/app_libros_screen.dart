import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/routes/app_pages.dart';

class AppLibrosScreen extends StatelessWidget {
  const AppLibrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * .1),
                  child: const Text(
                    'Bienvenido a\nLibro Mobile',
                    style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Align(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.CREARLIBROSPAGE),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(Get.width * .5, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('Crear libro'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.VERLIBROSPAGE),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(Get.width * .5, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('Ver Libros'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
