import 'package:animate_do/animate_do.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_con_angel01/ui/global_widgets/input_genery.dart';
import 'package:get_con_angel01/ui/pages/APP-LIBROS-U/app_libros_controller.dart';

class CreateLibrosPage extends StatefulWidget {
  const CreateLibrosPage({super.key});

  @override
  State<CreateLibrosPage> createState() => _CreateLibrosPageState();
}

class _CreateLibrosPageState extends State<CreateLibrosPage> {
  final controllerLibros = AppLibrosController.to;

  final PageController _pageController = PageController();

  AnimationController? _animedController1;

  AnimationController? _animedController2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => Column(
                children: [
                  const SizedBox(height: 30),
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
                            'Crea tu libro',
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
                  SizedBox(
                    height: Get.height * .8,
                    width: Get.width,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: onPagechange,
                      children: [
                        PrimerForm(),
                        SegundoFrom(),
                      ],
                    ),
                  ),
                  if (controllerLibros.indexForm.value == 0) ...[
                    ZoomIn(
                      duration: const Duration(milliseconds: 700),
                      controller: (controller1) {
                        print('Se asigno conytroller');
                        _animedController1 = controller1;
                      },
                      child: TextButton(
                        onPressed: funtionNext,
                        child: const Text(
                          'Siguiente',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                  if (controllerLibros.indexForm.value == 1)
                    ZoomIn(
                      duration: const Duration(milliseconds: 700),
                      controller: (controller2) {
                        _animedController2 = controller2;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: funtionBack,
                              child: const Text(
                                'Atras',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: controllerLibros.createLibros,
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(150, 40)),
                              child: const Text('Crear Libro'),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  initAnimationNext() async {
    if (_animedController2 != null) {
      _animedController2!.forward();
    }
    if (_animedController1 != null) {
      _animedController1!.reverse();
    }

    await 0.7.delay();
  }

  initAnimationBack() async {
    if (_animedController2 != null) {
      _animedController2!.reverse();
    }
    if (_animedController1 != null) {
      _animedController1!.forward();
    }

    await 0.7.delay();
  }

  funtionBack() {
    initAnimationBack();
    FocusScope.of(context).unfocus();
    _pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  funtionNext() {
    initAnimationNext();
    FocusScope.of(context).unfocus();
    _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  onPagechange(int page) {
    controllerLibros.indexForm.value = page;
    if (page == 1) {
      initAnimationNext();
    } else {
      initAnimationBack();
    }
  }
}

class PrimerForm extends StatelessWidget {
  PrimerForm({super.key});
  final controllerLibros = AppLibrosController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputGenery(
            initialValue: controllerLibros.titulo,
            hintText: 'Titulo',
            textInputType: TextInputType.text,
            onChanged: (value) {
              controllerLibros.titulo = value;
            },
          ),
          InputGenery(
            initialValue: controllerLibros.autor,
            hintText: 'Autor',
            textInputType: TextInputType.text,
            onChanged: (value) {
              controllerLibros.autor = value;
            },
          ),
          InputGenery(
            initialValue: controllerLibros.tipo,
            hintText: 'Tipo del libro',
            textInputType: TextInputType.text,
            onChanged: (value) {
              controllerLibros.tipo = value;
            },
          ),
          InputGenery(
            initialValue: controllerLibros.material,
            hintText: 'Material del libro',
            textInputType: TextInputType.text,
            onChanged: (value) {
              controllerLibros.material = value;
            },
          ),
          InputGenery(
            initialValue: controllerLibros.altura,
            hintText: 'Altura del libro',
            textInputType: TextInputType.number,
            onChanged: (value) {
              controllerLibros.altura = value;
            },
          ),
          InputGenery(
            initialValue: (controllerLibros.peso ?? '').toString(),
            hintText: 'Peso del libro',
            textInputType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty) {
                controllerLibros.peso = double.parse(value);
              }
            },
          ),
          InputGenery(
            initialValue: controllerLibros.diametro,
            hintText: 'Diametro del libro',
            textInputType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty) {
                controllerLibros.diametro = value;
              }
            },
          ),
        ],
      ),
    );
  }
}

class SegundoFrom extends StatelessWidget {
  SegundoFrom({super.key});
  final controllerLibros = AppLibrosController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputGenery(
            initialValue: controllerLibros.ancho,
            hintText: 'Ancho del libro',
            textInputType: TextInputType.number,
            onChanged: (value) {
              controllerLibros.ancho = value;
            },
          ),
          InputGenery(
            initialValue: controllerLibros.espesor,
            hintText: 'Espesor del libro',
            textInputType: TextInputType.number,
            onChanged: (value) {
              controllerLibros.espesor = value;
            },
          ),
          InputGenery(
            initialValue: (controllerLibros.valorComercial ?? '').toString(),
            hintText: 'Valor comercial del libro',
            textInputType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty) {
                controllerLibros.valorComercial = double.parse(value);
              }
            },
          ),
          InputGenery(
            initialValue: (controllerLibros.valorHistorico ?? '').toString(),
            hintText: 'Valor histórico del libro',
            textInputType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty) {
                controllerLibros.valorHistorico = double.parse(value);
              }
            },
          ),
          SizedBox(
            height: 50,
            child: DateTimeFormField(
              initialDate: controllerLibros.yearCreation,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black45),
                errorStyle: const TextStyle(color: Colors.redAccent),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(.8),
                    width: 2,
                  ),
                ),
                suffixIcon: const Icon(Icons.event_note),
                labelText: 'Año de creación del libro',
                hintText: 'Año de creación del libro',
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              lastDate: DateTime.now(),
              onDateSelected: (DateTime value) {
                controllerLibros.yearCreation = value;
              },
            ),
          ),
          InputGeneryAmplio(
            initialValue: controllerLibros.descripcion,
            hintText: 'Descripción del libro',
            textInputType: TextInputType.text,
            onChanged: (value) {
              controllerLibros.descripcion = value;
            },
          ),
        ],
      ),
    );
  }
}
