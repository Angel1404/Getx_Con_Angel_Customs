import 'package:get/get.dart';
import 'package:get_con_angel01/data/models/person_model.dart';

class VariableController extends GetxController {
  final name = 'Hola Flutteros'.obs;
  final numberw = 0.obs;
  final numberD = 0.0.obs;
  final isname = false.obs;

  final newList = <int>[].obs;
  // final newList = RxList<NombreDeSuModelo>([]);

  // final myMap = <String, dynamic>{}.obs;
  final myMap = RxMap<String, int>({});

  changeName(String newName) {
    name.value = newName;
  }

  changeNewList(int index) {
    newList.add(index);
  }

  removeIndex() {
    newList.removeLast();
  }

  //Clases reacivas

  final user = RxPerson().obs;

  changePerson() {
    user.value.name = 'Pedro';
    user.refresh();
  }

  changePerson2() {
    user.update((person) {
      person!.age = 29;
      person.name = 'Juan';
    });
  }
}
