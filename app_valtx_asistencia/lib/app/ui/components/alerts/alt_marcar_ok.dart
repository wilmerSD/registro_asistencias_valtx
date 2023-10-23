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
              String? ubicacion = item.value.ubicacin;
              return AlertDialogComponent(
                content: controller.statusMessageUserAssistance.value,
                onTapButton: () {
                  Get.back();
                },
                widgetContent: /* Container(
                  height: 200,
                  child:  */
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Asistencia registrada como: $registradoComo',
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: AppTextStyle(context).bold16(
                          color: AppColors.primary,
                        )),
                    if (registradoComo == 'Falta')
                      Text('Por favor comunicarse con Líder Técnico',
                          textScaleFactor: 1,
                          style: AppTextStyle(context).medium14(
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          color: AppColors.degradedInitial,
                        ),
                        Text(controller.nameLocation.value,
                            textScaleFactor: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle(context).bold16(
                              color: AppColors.primary,
                            )),
                      ],
                    )
                  ],
                ),
                /* ), */
                isOnlyPrimary: true,
                textPrimaryButton: "OK",
              );
            }));
  }
}
