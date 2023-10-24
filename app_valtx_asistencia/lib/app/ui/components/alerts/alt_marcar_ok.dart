import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
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
              String? detail = item.value.detalle;
              return AlertDialogComponent(
                headerTitle: "Información",
                content: controller.statusMessageUserAssistance.value,
                onTapButton: () {
                  Get.back();
                },
                widgetContent: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$registradoComo',
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: AppTextStyle(context).bold16(
                          color: AppColors.primary,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      detail ?? '',
                      textScaleFactor: 1,
                      textAlign: TextAlign.center,
                      style: AppTextStyle(context).medium14(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                isOnlyPrimary: true,
                textPrimaryButton: "OK",
              );
            }));
  }
}
