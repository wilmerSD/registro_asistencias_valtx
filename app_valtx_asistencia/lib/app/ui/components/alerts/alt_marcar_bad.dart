import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AltMarcarBad extends StatelessWidget {
  const AltMarcarBad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Obx(
        () {
          return AlertDialogComponent(
            /* content: controller.statusMessageUserAssistance.value, */
            onTapButton: () {
              Get.back();
            },
            isOnlyPrimary: true,
            textPrimaryButton: "OK",
            widgetContent: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${controller.statusMessageUserAssistance.value}",
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: AppTextStyle(context).bold14(
                    color: AppColors.primary,
                  ),
                ),
                /* Text('Por favor comunicarse con tu Líder Técnico',
                    textScaleFactor: 1,
                    style: AppTextStyle(context).medium14(
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center), */
              ],
            ),
          );
        },
      ),
    );
  }
}
