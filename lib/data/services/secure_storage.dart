import 'dart:convert';

import 'package:get_con_angel01/data/models/libro_model.dart';
import 'package:get_storage/get_storage.dart';

const keyLibro = 'libro';

class StorageLibros {
  saveLibros(LibroModel libro) {
    GetStorage box = GetStorage();
    List<LibroModel> librosSaved = getLibros();
    List<Map<String, dynamic>> data = [];
    if (librosSaved.isNotEmpty) {
      librosSaved.add(libro);
      for (var i = 0; i < librosSaved.length; i++) {
        final libroOld = librosSaved[i];
        data.add(libroOld.toMap());
      }
      box.write(keyLibro, json.encode({'libros': data}));
    }
    box.write(
        keyLibro,
        json.encode({
          'libros': [libro.toMap()]
        }));
  }

  List<LibroModel> getLibros() {
    GetStorage box = GetStorage();
    final data = box.read(keyLibro);
    if (data != null) {
      List<LibroModel> libros = [];
      List<dynamic> dataNew = json.decode(data['libros']);
      for (var i = 0; i < dataNew.length; i++) {
        final data = libroModelFromMap(dataNew[i]);
        libros.add(data);
      }
      return libros;
    }
    return [];
  }
}
