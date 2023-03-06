import 'package:get/get.dart';
import 'package:get_con_angel01/data/models/libro_model.dart';
import 'package:get_con_angel01/routes/app_pages.dart';
import 'package:get_con_angel01/ui/utils/dialogs.dart';

class AppLibrosController extends GetxController {
  static AppLibrosController get to => Get.find<AppLibrosController>();
  dynamic id;
  dynamic tipo;
  dynamic autor;
  dynamic material;
  dynamic altura;
  dynamic peso;
  dynamic ancho;
  dynamic diametro;
  dynamic espesor;
  dynamic valorComercial;
  dynamic valorHistorico;
  dynamic descripcion;
  dynamic titulo;
  dynamic yearCreation;
  dynamic updatedAt;
  final indexForm = 0.obs;

  final listLibros = RxList<LibroModel>([]);

  createLibros() async {
    if (titulo == null || titulo!.isEmpty) {
      return doneDialodOk(message: 'Titulo es requerido');
    }
    if (autor == null || autor!.isEmpty) {
      return doneDialodOk(message: 'Autor es requerido');
    }
    if (valorComercial == null) {
      return doneDialodOk(message: 'Valor comercial es requerido');
    }
    if (valorHistorico == null) {
      return doneDialodOk(message: 'Valor histórtico es requerido');
    }
    if (yearCreation == null) {
      return doneDialodOk(message: 'El año de creación es requerido');
    }
    if (descripcion == null || descripcion!.isEmpty) {
      return doneDialodOk(message: 'Descripción es requerida');
    }

    final newLibro = LibroModel(
      id: id,
      tipo: tipo,
      autor: autor,
      material: material,
      altura: altura,
      peso: peso,
      ancho: ancho,
      diametro: diametro,
      espesor: espesor,
      valorComercial: valorComercial,
      valorHistorico: valorHistorico,
      descripcion: descripcion,
      titulo: titulo,
      yearCreation: yearCreation,
      updatedAt: updatedAt,
    );
    listLibros.add(newLibro);
    snackBarInfo(messageTitle: 'Libro creado', bodyMessage: 'Puede ver los libros creados en la opcion, Ver libros');

    Get.toNamed(Routes.APPLIBROSSREEN);
    indexForm.value = 0;
    clearData();
  }

  onTapBack() {
    indexForm.value = 0;
    Get.back();
  }

  clearData() {
    id = null;
    tipo = null;
    autor = null;
    material = null;
    altura = null;
    peso = null;
    ancho = null;
    diametro = null;
    espesor = null;
    valorComercial = null;
    valorHistorico = null;
    descripcion = null;
    titulo = null;
    yearCreation = null;
    updatedAt = null;
  }

  List<dynamic> antiguedadLibro({required LibroModel libro}) {
    final timeActual = DateTime.now();
    final timeCreation = timeActual.difference(libro.yearCreation!);
    final yearsLibro = timeCreation.inDays ~/ 365;
    if (yearsLibro < 10) {
      return [ClassLibros.comtemporaneo, 'Comtemporáneo'];
    }

    if (yearsLibro <= 30) {
      return [ClassLibros.arteModerno, 'Arte Moderno'];
    }

    if (yearsLibro <= 100) {
      return [ClassLibros.antiguo, 'Antiguo'];
    }

    return [ClassLibros.reliquia, 'Reliquia'];
  }

  String viewInfoTitle({required ClassLibros classLibros, required LibroModel libroModel}) {
    final title = libroModel.titulo ?? 'NN';
    final descripcion = libroModel.descripcion ?? 'NN';
    final nombreAutor = libroModel.autor ?? 'NN';
    if (classLibros == ClassLibros.reliquia) {
      final nameterial = libroModel.material ?? 'NN';
      return '$nombreAutor, ${title.toUpperCase()} - $nameterial';
    }

    if (classLibros == ClassLibros.comtemporaneo) {
      final title2 = title.capitalizeFirst ?? title;
      return '$title2 : ${descripcion.toLowerCase()}';
    }

    return '$title, $nombreAutor';
  }
}

enum ClassLibros {
  comtemporaneo('Comtemporáneo'),
  arteModerno('Arte Moderno'),
  antiguo('Antiguo'),
  reliquia('Reliquia');

  final String select;
  const ClassLibros(this.select);
}
