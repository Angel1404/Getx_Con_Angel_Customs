import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

const loadingIconLottie = 'assets/lotties/loading.json';
const errorIconLottie = 'assets/lotties/error.json';
const okText = 'Ok';

//Dialogo para la carga de algun evento asincrono de la app
//Dialog for the burden of some event async of the app
void dialogLoading() {
  Get.dialog(transitionCurve: Curves.easeInBack, Lottie.asset(loadingIconLottie));
}

//Dialogo para mensajes cortos de error o exito
//Dialog for messages small of error or sucess
void doneDialodOk({String message = 'Tu mensaje aquí', Function()? ontap, bool doneOK = true, String? iconLottie}) {
  Get.dialog(
    barrierDismissible: false,
    transitionCurve: Curves.bounceInOut,
    transitionDuration: const Duration(milliseconds: 400),
    SimpleDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(iconLottie ?? errorIconLottie, fit: BoxFit.fill, height: 150, width: 150),
            Text(
              message,
              textAlign: TextAlign.center,
              style: labelErrorDialog,
            ),
            Container(
              height: 1,
              color: Colors.grey.withOpacity(.8),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
            ),
            InkWell(
              onTap: ontap ?? () => Get.back(),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                child: const Text(
                  okText,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//Snack informativo para eventos finalizados en la app
//Snack information for events finished in the app
void snackBarInfo({String bodyMessage = 'User', String messageTitle = 'Registro Exitoso', Color? backgroundColor, bool topSnack = false}) {
  Get.snackbar(
    messageTitle,
    bodyMessage,
    backgroundColor: backgroundColor ?? Colors.green,
    barBlur: 20,
    duration: const Duration(seconds: 5),
    colorText: Colors.white,
    margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
    snackPosition: topSnack ? null : SnackPosition.BOTTOM,
  );
}

const labelErrorDialog = TextStyle(
  fontSize: 18,
  color: Colors.black87,
);
