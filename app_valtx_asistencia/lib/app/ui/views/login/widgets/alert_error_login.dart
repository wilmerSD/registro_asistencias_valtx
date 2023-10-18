import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertErrorLogin extends StatelessWidget {
  const AlertErrorLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Obx(
        () {
          return controller.isLoading.value
              ?const Stack(
                  children: [
                    ModalBarrier(
                      color: AppColors.modalBarrier,
                      dismissible: false,
                    ),
                     Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.blueDark
                        ),
                      ),
                    ),
                  ],
                )
              : Visibility(
                  visible: controller.isVisible.value,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AlertDialog(
                      backgroundColor:  AppColors.backgroundColor,
                      title: const Text(
                        "Error",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      content: Text(
                        controller.messageError.value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            controller.messageError.value = "";
                            controller.isVisible.value = false;
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
