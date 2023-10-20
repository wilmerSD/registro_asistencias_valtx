import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Instances
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  //Variables
  RxString messageError = RxString("");
  RxBool isLoading = false.obs;
  RxBool isVisible = true.obs;

  //TextEditingController
  TextEditingController ctrlEmailText = TextEditingController();
  TextEditingController ctrlPasswordText = TextEditingController();

  //Functions
  void _initialize() async {
    ctrlEmailText.text = "";
    ctrlPasswordText.text = "";
  }

  void setPrivate() {
    isVisible.value ? isVisible.value = false : isVisible.value = true;
  }

  void validateForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (ctrlEmailText.text.trim() == "" || ctrlPasswordText.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Ingrese su correo electrónico y contraseña",
      );
      return;
    }

    doAuthentication();
  }

  void doAuthentication() async {
    isLoading.value = true;
    try {
      final response = await _authenticationRepository.postAuthentication(
        RequestAuthenticationModel(
          username: ctrlEmailText.text.trim(),
          password: ctrlPasswordText.text.trim(),
        ),
      );
      isLoading.value = false;
      messageError.value = response.statusMessage;
      if (!response.success) {
        isVisible.value = true;
        Helpers.showSnackBar(
          Get.context!,
          title: "Validar",
          message: "Ups! Ocurrió un error, ${response.statusMessage}",
        );
        return;
      }

      //Guardar la información en sesión
      await StorageService.set(
          key: Keys.kTokenSesion, value: response.data!.token);
      await StorageService.set(
          key: Keys.kUserName, value: ctrlEmailText.text.trim());
      await StorageService.set(
          key: Keys.kPassword, value: ctrlPasswordText.text.trim());

      //Ir a nueva ruta y eliminar de memoria controllers existentes
      Get.offNamed(AppRoutesName.HOME);
    } catch (error) {
      isVisible.value = true;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message:
            "Ups! Ocurrió un error, por favor inténtelo de nuevo más tarde.",
      );
    }
  }
}
