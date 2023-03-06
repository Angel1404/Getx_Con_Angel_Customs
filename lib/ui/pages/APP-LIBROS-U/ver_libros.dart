import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'app_libros_controller.dart';

class VerLibrosPage extends StatelessWidget {
  VerLibrosPage({super.key});
  final controllerLibros = AppLibrosController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              _TopCard(controllerLibros: controllerLibros),
              if (controllerLibros.listLibros.isNotEmpty) ...[
                _ViewListLibros(controllerLibros: controllerLibros),
              ] else ...[
                const _NoLibros(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TopCard extends StatelessWidget {
  const _TopCard({
    required this.controllerLibros,
  });

  final AppLibrosController controllerLibros;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .05,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: controllerLibros.onTapBack,
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            ),
            const Text(
              'Libros Creados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoLibros extends StatelessWidget {
  const _NoLibros();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height * .9,
      child: const Text(
        'No Hay libros registrados',
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
    );
  }
}

class _ViewListLibros extends StatelessWidget {
  const _ViewListLibros({
    required this.controllerLibros,
  });

  final AppLibrosController controllerLibros;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .8,
      child: ListView.builder(
        itemCount: controllerLibros.listLibros.length,
        itemBuilder: (context, index) {
          final data = controllerLibros.listLibros[index];
          return ListTile(
            title: Text('Titulo: ${data.titulo ?? 'Nn'}'),
            subtitle: Text('Autor: ${data.autor ?? 'Nn'}'),
            trailing: const Icon(Icons.arrow_forward_ios_sharp, color: Colors.orange, size: 20),
            onTap: () {
              Get.toNamed(Routes.DETALLELIBROPAGE, arguments: data);
            },
          );
        },
      ),
    );
  }
}
