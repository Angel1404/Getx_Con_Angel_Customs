import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/data/models/libro_model.dart';
import 'package:get_con_angel01/ui/pages/APP-LIBROS-U/app_libros_controller.dart';
import 'package:intl/intl.dart';

class DetalleLibroPage extends StatelessWidget {
  DetalleLibroPage({super.key});

  final controllerLibros = AppLibrosController.to;

  final LibroModel libro = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final String antiguedadLibro = (controllerLibros.antiguedadLibro(libro: libro))[1];
    final ClassLibros classantiguedadLibro = (controllerLibros.antiguedadLibro(libro: libro))[0];
    final titleLibro = controllerLibros.viewInfoTitle(classLibros: classantiguedadLibro, libroModel: libro);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
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
                        'Detalle del libro',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _ContentInformation(title: 'Antiguedad', body: antiguedadLibro),
                  _ContentInformation(
                      title: 'Titulo y ${classantiguedadLibro == ClassLibros.comtemporaneo ? 'Descripción' : 'autor'}', body: titleLibro),
                  _ContentInformation(title: 'Valor histórico', body: r'$' + libro.valorHistorico.toString()),
                  _ContentInformation(title: 'Valor comercial', body: r'$' + libro.valorComercial.toString()),
                  _ContentInformation(title: 'Año de creación', body: DateFormat.yMd().format(libro.yearCreation!)),
                  _ContentInformation(title: 'Altura', body: libro.altura ?? 'Nn'),
                  _ContentInformation(title: 'Peso', body: '${libro.peso ?? 'Nn'}'),
                  _ContentInformation(title: 'Diámetro', body: libro.diametro ?? 'Nn'),
                  _ContentInformation(title: 'Espesor', body: libro.espesor ?? 'Nn'),
                  if (!(classantiguedadLibro == ClassLibros.comtemporaneo))
                    _ContentInformation(title: 'Descripción', body: libro.descripcion ?? 'NN'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentInformation extends StatelessWidget {
  const _ContentInformation({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 0),
            color: Colors.black12,
            blurRadius: 5,
          ),
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        border: Border.all(color: generateRandomPastelColor()),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            body,
            style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Color generateRandomPastelColor() {
    final random = Random();
    final r = 100 + random.nextInt(155); // Asegura que el componente rojo esté entre 100 y 255
    final g = 100 + random.nextInt(155); // Asegura que el componente verde esté entre 100 y 255
    final b = 100 + random.nextInt(155); // Asegura que el componente azul esté entre 100 y 255
    return Color.fromARGB(255, r, g, b).withOpacity(0.7); // Opacidad de 0.7 para lograr el efecto pastel
  }
}
