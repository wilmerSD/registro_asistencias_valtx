import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AltMarcarOk extends StatelessWidget {
  const AltMarcarOk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Obx(() {
              final item = controller.responseUserAssistance;
              String? registradoComo = item.value.registradoComo;
              String? ubicacion = item.value.ubicacin;
              return AlertDialogComponent(
                content: controller.statusMessageUserAssistance.value,
                onTapButton: () {
                  Get.back();
                },
                widgetContent: Container(
                  height: 200,
                  child: Column(children: [
                    Text(
                      'Asistencia registrada como: $registradoComo',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: AppColors.blueDark,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          color: AppColors.degradedInitial,
                        ),
                        Text(
                          ubicacion ?? '-------',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: AppColors.blueDark,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
                isOnlyPrimary: true,
                textPrimaryButton: "OK",
              );
            }));
  }
}
